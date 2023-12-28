import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPerson extends StatefulWidget {
  const CardPerson({super.key, required this.photo, required this.name, required this.about});

  final String photo;
  final String name;
  final String about;

  @override
  State<CardPerson> createState() => _CardPersonState();
}

class _CardPersonState extends State<CardPerson> {

  static TextStyle textStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'Prompt',
    fontWeight: FontWeight.bold,
    fontSize: 25.0
  );

  static Route<void> _showPopUp(BuildContext context, Object? arguments) {
    return CupertinoModalPopupRoute<void>(
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
                onPressed:() => Navigator.pop(context),
                child: Row(
                  children: [
                     const SizedBox(
                       width: 80.0,
                       child: Icon(Icons.person,size: 40.0,),
                     ),
                     Text('VIEW PROFILE', style: textStyle),
                  ]
                ),
            ),
            CupertinoActionSheetAction(
              onPressed:() => Navigator.pop(context),
              child: Row(
                  children: [
                    const SizedBox(
                      width: 80.0,
                      child: Icon(Icons.people,size: 40.0,),
                    ),
                    Text('FRIENDS', style: textStyle),
                  ]
              ),
            ),
            CupertinoActionSheetAction(
              onPressed:() => Navigator.pop(context),
              child: Row(
                  children: [
                    const SizedBox(
                      width: 80.0,
                      child: Icon(Icons.text_snippet_outlined,size: 40.0,),
                    ),
                    Text('REPORT', style: textStyle),
                  ]
              ),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).restorablePush(_showPopUp),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          color: Colors.cyan,
          child: Row(
            children: [
              Container(
                color: Colors.cyan,
                width: 80.0,
                height: 80.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.photo),
                  radius: 60.0,
                ),
              ),
              Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(widget.name,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: Text(widget.about,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.black38,
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,),
                          ),
                        )
                      ],
                    )
                  )
              ),
            ],
          ),
        )
      )
    );
  }
}
