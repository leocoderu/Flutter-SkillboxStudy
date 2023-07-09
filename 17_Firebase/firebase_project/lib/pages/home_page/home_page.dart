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
import 'package:firebase_project/pages/home_page/widgets/home_appbar.dart';
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

  //bool _productsLoaded = false;
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
        title: Text(AppLocalizations.of(context)!.titleApp),
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
                //initialData: locator.get<ProdController>().initProducts(),
                stream: _products.snapshots(), //locator.get<ProdController>().streamProducts(),
                builder: (context, snapshot) { // || (!_productsLoaded)
                  if (!_placesLoaded || !_currencyLoaded || !_unitsLoaded || !snapshot.hasData) {return myProgressIndicator();}
                  //if (!snapshot.hasData) return myProgressIndicator();
                  // Список Уникальных мест в которых нужно купить продукты
                  Set<Place> _uPlace = Set<Place>();
                  snapshot.data!.docs.map((e) => _uPlace.add(_places!.firstWhere((p) => p.id == e.get('place')))).toList();// _products!
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: ListView(
                            children: _uPlace.map((p) =>
                                ExpansionTile(
                                  title: Text(p.name),  // _products!
                                  children: snapshot.data!.docs.expand((e) => [if (p.id == e.get('place'))
                                    ItemList(
                                      collection: _products,
                                      currency: _currency,
                                      units: _units,
                                      places: _places,
                                      product: e,),
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
      bottomNavigationBar: HomeAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {changeForm(context, _products, _places, _currency, _units);},
        tooltip: AppLocalizations.of(context)!.tooltipFBut,
        child: const Icon(Icons.add),
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
