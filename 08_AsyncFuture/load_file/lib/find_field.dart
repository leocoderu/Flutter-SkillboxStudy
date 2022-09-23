import 'package:flutter/material.dart';

class FindField extends StatefulWidget {
  const FindField({Key? key, this.padding = const EdgeInsets.all(0.0), required this.callback}) : super(key: key);

  final EdgeInsetsGeometry padding;
  final Function(String prop) callback;

  @override
  State<FindField> createState() => _FindFieldState();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FindFieldState extends State<FindField> {
  TextEditingController findController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding,
        child: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
                  controller: findController,
                  decoration: const InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    //prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                      ),
                      hintText: 'Например: hope.txt',
                      //helperText: 'Открытие текстового файла',
                      labelText: 'Введите имя файла'
                  ),
                )
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20.0, vertical: 21.5)),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              child: const Text('Найти'),
              onPressed: () {
                widget.callback(findController.text);
              },
            ),
          ],
        ),
    );
  }
}