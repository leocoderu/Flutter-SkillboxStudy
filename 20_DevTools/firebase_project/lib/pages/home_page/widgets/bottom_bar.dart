// // Import Flutter
// import 'package:flutter/material.dart';
//
// // Import Packages
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// // Import Localizations
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class BottomBar extends StatefulWidget{
//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }
//
// class _BottomBarState extends State<BottomBar> {
//   int _tabIndex = 0;
//
//   @override
//   Widget build(BuildContext context){
//     return BottomAppBar(
//       color: Colors.blue,
//       height: 100,
//       shape: CircularNotchedRectangle(),
//       notchMargin: 5,
//       clipBehavior: Clip.antiAlias,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         mainAxisSize: MainAxisSize.max,
//         children:[
//           ItemNavigation(0, FontAwesomeIcons.listCheck, AppLocalizations.of(context)!.home_bottom_need_buy),
//           ItemNavigation(1, FontAwesomeIcons.list, AppLocalizations.of(context)!.home_bottom_full_list),
//         ],
//       ),
//     );
//   }
//
//   Widget ItemNavigation(int index, IconData icon, String name) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         elevation: MaterialStateProperty.all(0.0),
//         maximumSize: MaterialStateProperty.all(const Size(150, 100)),
//       ),
//       onPressed: () {
//         setState(() {
//           _tabIndex = index;
//         });
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children:[
//           FaIcon(icon, size: 30,),
//           Padding(
//             padding: EdgeInsets.only(top: 5),
//             child: Text(name, style: index == _tabIndex ? TextStyle(shadows: [Shadow(color: Colors.white, blurRadius: 10),]) : null),
//           ),
//         ],
//       ),
//     );
//   }
// }