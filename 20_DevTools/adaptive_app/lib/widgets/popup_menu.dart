import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  static TextStyle textStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'Prompt',
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
                height: 30,
                child: Row(
                    children: [
                      const SizedBox(
                        width: 60.0,
                        child: Icon(Icons.person,size: 30.0,),
                      ),
                      Text('VIEW PROFILE', style: textStyle),
                    ]
                )
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
                height: 30,
                child: Row(
                    children: [
                      const SizedBox(
                        width: 60.0,
                        child: Icon(Icons.people,size: 30.0,),
                      ),
                      Text('FRIENDS', style: textStyle),
                    ]
                )
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
                height: 30,
                child: Row(
                    children: [
                      const SizedBox(
                        width: 60.0,
                        child: Icon(Icons.text_snippet_outlined,size: 30.0,),
                      ),
                      Text('REPORT', style: textStyle),
                    ]
                )
            ),
          ),
        ],
      ),
    );
  }
}