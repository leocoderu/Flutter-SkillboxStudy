import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:model/model.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key, required this.maxID, this.user, this.onGetValue}); //
  final int maxID;
  final User? user; //TODO: < --- Форме предавать объект User, а не индекс
  final ValueChanged<User>? onGetValue;
  //final ValueChanged<UsersCompanion>? onGetValue;

  //TODO: callback function for return Object of User type

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  //late MyDatabase _usersbase;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sonameController = TextEditingController();
  final TextEditingController _s_nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();

  late int? _id;
  late DateTime? _dateBirth;
  String _textOnDateButton = 'Select Day of Birth';

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
        _id = widget.user!.id;
      //_usersbase.getUserById(widget.index!).then((e) {
        _nameController.text = widget.user!.name;
        _sonameController.text = widget.user!.soname ?? '';
        _s_nameController.text = widget.user!.s_name ?? '';
        _phoneController.text = widget.user!.phone ?? '';
        _cardController.text = widget.user!.card ?? '';
        _photoController.text = widget.user!.photo ?? '';
        _dateBirth = widget.user!.dateBirth;
        _textOnDateButton = dateToString(widget.user!.dateBirth);
      //});
    } else {
      _clearFields();
    }
  }

  void _clearFields() {
    _id = null;
    _dateBirth = null;
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
        title: Text('${_id} - ${widget.maxID} - Add User'),centerTitle: true,
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
                                            maxLength: 32,
                                            decoration: const InputDecoration(
                                              labelText: 'First Name',
                                              hintText: 'Enter First Name',
                                            ),
                                          ),
                                          TextField(
                                            style: t1,
                                            controller: _sonameController,
                                            maxLength: 32,
                                            decoration: const InputDecoration(
                                              labelText: 'SoName',
                                              hintText: 'Enter Soname',
                                            ),
                                          ),
                                          TextField(
                                            style: t1,
                                            controller: _s_nameController,
                                            maxLength: 32,
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
                                      child: (widget.user != null) || (_photoController.text != '')
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
                                  onEditingComplete: () => setState(() {}),
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
                                              _dateBirth = newDate;
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
                      User nUser = User(
                        id: _id == null ? widget.maxID + 1 : _id!,
                        name: _nameController.text.trim(),
                        soname: _sonameController.text.trim() == '' ? null : _sonameController.text.trim(),
                        s_name: _s_nameController.text.trim() == '' ? null : _s_nameController.text.trim(),
                        photo: _photoController.text == '' ? null : _photoController.text,
                        dateBirth: _dateBirth,
                        phone: phoneFormatter.getUnmaskedText() == '' ? null : phoneFormatter.getUnmaskedText(),
                        card: cardFormatter.getUnmaskedText() == '' ? null : cardFormatter.getUnmaskedText(),
                      );
                      // TODO: Форма не работает с базой  на прямую, только возвращает подготовленные данные!!!
                      // TODO: Подготовить объект User и передать его в ф-ю обратного вызова
                      //(widget.index == null) ? _addUser(nUser) : _updUser(nUser);
                      widget.onGetValue!(nUser);
                      _clearFields();
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.user == null ? 'Add User' : 'Update User', style: t1,),
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
