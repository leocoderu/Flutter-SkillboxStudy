// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:fluttertoast/fluttertoast.dart';

// Import Localizations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Import Layers
import 'package:business_sm/business_sm.dart';

// Import Widgets
import 'package:firebase_project/pages/home_page/drawer_widget.dart';
import 'package:firebase_project/pages/home_page/summary_panel/summary_panel.dart';

import 'home_appbar.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String photoURL = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    String? phURL;
    var _user = await locator.get<AuthController>().authUser();
    if ((_user != null) && (_user.user != null)) {
      phURL = _user.user!.photoURL;

      setState(() {
        photoURL = phURL ?? '';
      });
    };
  }

  DateTime? oldTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleApp),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.wifi_protected_setup),
          ),
        ],
      ),
      drawer: DrawerWidget(photoURL: photoURL),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Center(
                  // Где:     Рынок/Магазин/Супермаркет
                  // Что:     Яблоки/Масло/Молоко
                  // Сколько: 1,4кг/1 пачка/1,5л.
                  // Цена:    170,65р/кг / 220,50р. / 98,00р.
                  // Статус:  Купить / Куплено / Докупить /
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    //padding: const EdgeInsets.all(8),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        //color: Colors.amber,
                        child: ListTile(
                          //dense: false,

                          leading: Icon(Icons.ac_unit),
                          title: Text("Apple"),
                          trailing: Icon(Icons.access_alarm),
                        ),
                      );
                    },
                  ),
                ),
            ),
            SummaryPanel(),
          ],
        ),
      ),
      bottomNavigationBar: HomeAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
