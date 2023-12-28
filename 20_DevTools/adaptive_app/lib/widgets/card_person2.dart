import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'package:adaptive_app/widgets/popup_menu.dart';

class CardPerson2 extends StatefulWidget {
  const CardPerson2({super.key, required this.photo, required this.name, required this.about});

  final String photo;
  final String name;
  final String about;

  @override
  State<CardPerson2> createState() => _CardPersonState();
}

class _CardPersonState extends State<CardPerson2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: GestureDetector(
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => const PopupMenu(),
            direction: PopoverDirection.top,
            backgroundColor: Colors.white,
            width: 200,
            height: 150,
            arrowHeight: 15,
            arrowWidth: 40,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          color: Colors.cyan,
          child: Column(
            children: [
              Container(
                color: Colors.cyan,
                width: 65.0,
                height: 65.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.photo),
                  radius: 60.0,
                ),
              ),
              Flexible(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: Text(widget.name,
                            softWrap: true,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 16.0,
                          child: Text(widget.about,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.black38,
                              fontFamily: 'Prompt',
                              fontWeight: FontWeight.normal,
                              fontSize: 10.0,
                            ),
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
