import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:model/model.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key, required this.maxID, this.user, this.onGetValue}); //
  final int maxID;
  final User? user;
  final ValueChanged<FullUser>? onGetValue;

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sonameController = TextEditingController();
  final TextEditingController _s_nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();

  late int? _id;
  late DateTime? _dateBirth;
  String _textOnDateButton = 'Select Day of Birth';

  MaskTextInputFormatter phoneFormatter = new MaskTextInputFormatter(mask: '+# (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') }, type: MaskAutoCompletionType.lazy);
  MaskTextInputFormatter cardFormatter = new MaskTextInputFormatter(mask: '#### #### #### ####', filter: { "#": RegExp(r'[0-9]') }, type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
        _id = widget.user!.id;
        _nameController.text = widget.user!.name;
        _sonameController.text = widget.user!.soname ?? '';
        _s_nameController.text = widget.user!.s_name ?? '';
        _phoneController.text = phoneFormatter.maskText(widget.user!.phone ?? '');
        _cardController.text = cardFormatter.maskText(widget.user!.card ?? '');
        _photoController.text = widget.user!.photo ?? '';
        _dateBirth = widget.user!.dateBirth;
        _textOnDateButton = widget.user!.dateBirth != null ? dateToString(widget.user!.dateBirth) : 'Select Date';
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
    final TextStyle t1 = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.user == null ? 'Add User' : 'Change User'), centerTitle: true,
        automaticallyImplyLeading: false,
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
                                              labelText: 'Soname',
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
                                      height: 250.0,
                                      width:  167.0,
                                      child: (_photoController.text == '')
                                          ? Image.asset('assets/image/no_image.png', fit: BoxFit.cover)
                                          : Image.network(_photoController.text, fit: BoxFit.cover, errorBuilder: (context, exception, stack) =>
                                              Image.asset('assets/image/not_available.png'),
                                            ),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  style: t1,
                                  keyboardType: TextInputType.url,
                                  controller: _photoController,
                                  decoration: const InputDecoration(
                                    labelText: 'Photo URL',
                                    hintText: 'Enter URL to photo',
                                  ),
                                  onChanged: (text) => setState(() {}),
                                ),
                                const SizedBox(height: 5.0),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('Date of Birth: ',
                                          style: t1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200.0,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            DateTime? newDate = await showDatePicker(
                                              initialDate: _dateBirth,
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
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [phoneFormatter],
                                  decoration: const InputDecoration(
                                    labelText: 'Phone Number',
                                    hintText: 'Enter phone number',
                                  ),
                                ),
                                TextField(
                                  style: t1,
                                  controller: _cardController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [cardFormatter],
                                  decoration: const InputDecoration(
                                    labelText: 'Debit Card Number',
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
                      FullUser nUser = FullUser(
                        id: _id == null ? widget.maxID + 1 : _id!,
                        name: _nameController.text.trim(),
                        soname: _sonameController.text.trim() == '' ? null : _sonameController.text.trim(),
                        s_name: _s_nameController.text.trim() == '' ? null : _s_nameController.text.trim(),
                        photo: _photoController.text == '' ? null : _photoController.text,
                        dateBirth: _dateBirth,
                        phone: _phoneController.text == '' ? null : phoneFormatter.unmaskText(_phoneController.text),
                        card: _cardController.text == '' ? null : cardFormatter.unmaskText(_cardController.text),
                        card_num: _cardController.text == '' ? null : cardFormatter.unmaskText(_cardController.text),
                      );
                      widget.onGetValue!(nUser);
                      _clearFields();
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.user == null ? 'Add User' : 'Update User', style: t1,),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {Navigator.of(context).pop();},
                    child: Text('Cancel', style: t1),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
