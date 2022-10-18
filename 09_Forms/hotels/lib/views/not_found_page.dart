import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/route_unknown.jpg'),
                  fit: BoxFit.cover,
                )
            ),
            child:Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Route Not Found!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24.0),
                ),
                const Divider(),
                ElevatedButton(
                  autofocus: true,
                  child: const Text('<< Back'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
        )
    );
  }
}