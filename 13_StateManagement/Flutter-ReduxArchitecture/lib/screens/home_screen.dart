import 'package:flutter/material.dart';
import 'package:reduxdemo/core/constant/page_route_constants.dart';
import 'package:reduxdemo/core/constant/string_constant.dart';
import 'package:reduxdemo/core/resources/styles.dart' as MyTheme;
import 'package:reduxdemo/model/login/login_response.dart';

class HomeScreen extends StatefulWidget {
  final LoginResponse loginResponse;

  HomeScreen({this.loginResponse});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail:
                  Text('${widget.loginResponse?.result?.data?.email}'),
              accountName: Text(
                  "${widget.loginResponse?.result?.data?.name[0].toUpperCase() + widget.loginResponse?.result?.data?.name.substring(1)}" ??
                      ""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  widget.loginResponse?.result?.data?.name[0].toUpperCase(),
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text("Assessment"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("School"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text("Announcement"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          child: Text(
            StringConstant.welocome_to_home_screen,
            style: MyTheme.TextStyles.getExtraLargeText(
                size.width, MyTheme.Colors.black, PageRouteConstants.kBold),
          ),
        ),
      ),
    );
  }
}
