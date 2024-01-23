import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:model/model.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key, this.index});
  final int? index;

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  late MyDatabase _usersbase;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sonameController = TextEditingController();
  final TextEditingController _s_nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();

  String _textOnDateButton = 'Select Day of Birth';

  @override
  void initState() {
    super.initState();

    if (widget.index != null) {
      _usersbase.getUserById(widget.index!).then((e) {
        _nameController.text = e.name;
        _sonameController.text = e.soname ?? '';
        _s_nameController.text = e.s_name ?? '';
        _phoneController.text = e.phone ?? '';
        _cardController.text = e.card ?? '';
        _photoController.text = e.photo ?? '';
        _textOnDateButton = dateToString(e.dateBirth);
      });
    } else {
      _clearFields();
    }
  }

  void _clearFields() {
    _nameController.text = '';
    _sonameController.text = '';
    _s_nameController.text = '';
    _phoneController.text = '';
    _cardController.text = '';
    _photoController.text = '';
    _textOnDateButton = 'Select Date';
  }

  String dateToString(DateTime? dt) => dt != null
      ?'${dt.day < 10 ? '0' : ''}${dt.day}.${dt.month < 10 ? '0' : ''}${dt.month}.${dt.year}' : '';

  @override
  Widget build(BuildContext context) {
    var phoneFormatter = new MaskTextInputFormatter(mask: '+# (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') }, type: MaskAutoCompletionType.lazy);
    var cardFormatter = new MaskTextInputFormatter(mask: '#### #### #### ####', filter: { "#": RegExp(r'[0-9]') }, type: MaskAutoCompletionType.lazy);
    final bool lowDisplay = (MediaQuery.of(context).size.width <= 390);
    final TextStyle t1 = lowDisplay ? TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold) : TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Add User'),centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Expanded(
                  child: Card(
                    margin: const EdgeInsets.all(10.0),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Scrollbar(
                        trackVisibility: true,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TextField(
                                            style: t1,
                                            controller: _nameController,
                                            decoration: const InputDecoration(
                                              labelText: 'First Name',
                                              hintText: 'Enter First Name',
                                            ),
                                          ),
                                          TextField(
                                            style: t1,
                                            controller: _sonameController,
                                            decoration: const InputDecoration(
                                              labelText: 'SoName',
                                              hintText: 'Enter Soname',
                                            ),
                                          ),
                                          TextField(
                                            style: t1,
                                            controller: _s_nameController,
                                            decoration: const InputDecoration(
                                              labelText: 'Second Name',
                                              hintText: 'Enter Second Name',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10.0),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                                      height: lowDisplay ? 150.0 : 225.0,
                                      width:  lowDisplay ? 100 : 150,
                                      child: (widget.index != null)
                                          ? Image.network(_photoController.text, fit: BoxFit.cover,
                                        errorBuilder: (context, exception, stack) {
                                          return Image.asset('assets/image/not_available.png');
                                        },
                                      )
                                          : Image.asset('assets/image/no_image.png', fit: BoxFit.cover),
                                    ),
                                  ],
                                ),
                                TextField(
                                  style: t1,
                                  keyboardType: TextInputType.url,
                                  controller: _photoController,
                                  decoration: const InputDecoration(
                                    labelText: 'Photo URL',
                                    hintText: 'Enter URL to photo',
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('Date of Birth: ',
                                          style: t1, //TextStyle(color: Colors.black87, fontSize: t1.fontSize!.sign),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200.0,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            DateTime? newDate = await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100),
                                            );
                                            if(newDate == null) return;
                                            setState(() {
                                              _textOnDateButton = dateToString(newDate);
                                            });
                                          },
                                          child: Text(_textOnDateButton, style: t1,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextField(
                                  style: t1,
                                  controller: _phoneController,
                                  //maxLength: 13, //11
                                  //validator: ,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [phoneFormatter],
                                  decoration: const InputDecoration(
                                    labelText: 'Phone Number',
                                    hintText: 'Enter phone number',
                                    //helperText: 'Helper Text',
                                    //errorText: "Error Text",
                                    //prefixText: "Prefix Text",
                                    //suffixText: 'suffix Text',
                                    //semanticCounterText: 'semmantic Conter Text',
                                  ),
                                ),
                                TextField(
                                  style: t1,
                                  controller: _cardController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [cardFormatter],
                                  decoration: const InputDecoration(
                                    labelText: 'Dibit Card Number',
                                    hintText: 'Enter Card Number',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // final Person onePerson = Person(
                      //     id: int.tryParse(_idController.text) ?? 0,
                      //     name: _nameController.text.trim()
                      // );
                      // (idx == null) ? _insertPerson(onePerson) : _updatePerson(onePerson);
                      _clearFields();
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.index == null ? 'Add User' : 'Update User', style: t1,),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {Navigator.of(context).pop();},
                    child: Text('Cancel', style: t1,),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
