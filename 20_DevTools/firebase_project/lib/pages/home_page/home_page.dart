// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_project/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import Layers
import 'package:business_sm/business_sm.dart';
import 'package:model/model.dart';

// Import Widgets
import 'package:firebase_project/pages/home_page/widgets/drawer_widget.dart';
import 'package:firebase_project/pages/home_page/widgets/summary_panel/summary_panel.dart';
import 'package:firebase_project/pages/home_page/widgets/item_list.dart';
import 'package:firebase_project/pages/home_page/widgets/change_form.dart';
import 'package:firebase_project/pages/home_page/widgets/progress_indicator.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CollectionReference<Product> _products;

  List<Place>? _places;
  List<Currency>? _currency;
  List<Unit>? _units;
//  List<Product>? _products;

  bool _productsLoaded = false;
  bool _placesLoaded = false;
  bool _currencyLoaded = false;
  bool _unitsLoaded = false;

  bool _index_page = false;
  String photoURL = '';
  DateTime? oldTime;

  @override
  void initState() {
    getUserData();

    initProducts();
    getPlaces();
    getCurrency();
    getUnits();

    super.initState();
  }

  void getUserData() async {
    await locator.get<AuthController>().authUser().then((value) =>
        setState(() {
          photoURL = value!.user!.photoURL ?? '';
        }));
  }

  void initProducts() async {
    await locator.get<ProdController>().initProducts().then((value) =>
        setState(() {
          _products = value;
          _productsLoaded = true;
        })); //.then((value) =>
  }

  void getPlaces() async {
    await locator.get<PlaceController>().getPlaces().then((value) =>
        setState(() {
          _places = value;
          _placesLoaded = true;
        }));
  }
  void getCurrency() async {
    await locator.get<CurrencyController>().getCurrency().then((value) =>
        setState(() {
          _currency = value;
          _currencyLoaded = true;
        }));
  }
  void getUnits() async {
    await locator.get<UnitController>().getUnits().then((value) =>
        setState(() {
          _units = value;
          _unitsLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(!_index_page ? AppLocalizations.of(context)!.titleApp : AppLocalizations.of(context)!.titleList),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.gears),
            onPressed: () {MyFluroRouter.router.navigateTo(context, '/settings');},
          ),
        ],
      ),
      drawer: DrawerWidget(photoURL: photoURL),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: BlocBuilder<AppStateBloc, AppStateModel>(
          builder: (_, state) {
            return (!_productsLoaded)
              ? myProgressIndicator()
              : StreamBuilder(
                stream: _products.snapshots(), //locator.get<ProdController>().streamProducts(),
                builder: (context, snapshot) { // || (!_productsLoaded)
                  if (!_placesLoaded || !_currencyLoaded || !_unitsLoaded || !snapshot.hasData) {return myProgressIndicator();}

                  Set<Place> _uPlace = Set<Place>(); // Список Уникальных мест в которых нужно купить продукты
                  snapshot.data!.docs.expand((e) => [if (e.get('hide') == _index_page) _uPlace.add(_places!.firstWhere((p) => p.id == e.get('place')))]).toList();

                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: ListView(
                            children: _uPlace.map((p) =>
                                ExpansionTile(
                                  title: Text(p.name),  // _products!
                                  children:
                                    !_index_page ?
                                  snapshot.data!.docs.expand((e) => [if (p.id == e.get('place') && !e.get('hide'))
                                    ItemList(
                                      //collection: _products,
                                      currency: _currency,
                                      units: _units,
                                      places: _places,
                                      product: e.data(),),
                                  ]).toList()
                                        : snapshot.data!.docs.expand((e) => [if (p.id == e.get('place') && e.get('hide'))
                                      ItemList(
                                        //collection: _products,
                                        currency: _currency,
                                        units: _units,
                                        places: _places,
                                        product: e.data(),),
                                    ]).toList(),
                                ),
                            ).toList(),
                          ),
                        ),
                      ),
                      if (state.summary_panel) SummaryPanel(),
                    ],
                  );
                },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        height: 100,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children:[
            ItemNavigation(false, FontAwesomeIcons.listCheck, AppLocalizations.of(context)!.home_bottom_need_buy),
            ItemNavigation(true, FontAwesomeIcons.list, AppLocalizations.of(context)!.home_bottom_full_list),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeForm(context, _places, _currency, _units);
        },
        tooltip: AppLocalizations.of(context)!.tooltipFBut,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget ItemNavigation(bool index, IconData icon, String name) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        maximumSize: MaterialStateProperty.all(const Size(150, 100)),
      ),
      onPressed: () {
        setState(() {
          _index_page = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          FaIcon(icon, size: 30,),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(name, style: index == _index_page ? TextStyle(shadows: [Shadow(color: Colors.white, blurRadius: 10),]) : null),
          ),
        ],
      ),
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = oldTime == null || currentTime.difference(oldTime!) > Duration(seconds: 3);
    if(backButton){
      oldTime = currentTime;
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.msgButToast,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );
      return false;
    };
    return true;
  }
}
