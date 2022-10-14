import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:serialization_codgen/user.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldNameCtr = TextEditingController();
  final TextEditingController _fieldEmailCtr = TextEditingController();
  final Dio _dio = Dio();

  void _submitForm(){
    if (_formKey.currentState!.validate()) {

      User user = User(
        id: 123123123,
        email: _fieldEmailCtr.text,
        name: _fieldNameCtr.text,
        username: 'Username field',
        address: UserAddress(
            street: 'Street',
            suite: 'Suite',
            city: 'City',
            zipcode: 'ZipCode'),
      );

      // ignore: avoid_print
      print(user.toJson());   // Печатаем состояние объекта в Json формате

      //_dio.post('path'); // Отправить данные post запросом, а от куда он знает какие данные отправлять???
      //_dio.get('path'); // Отправить данные get запросом,   где привязка к объекту user???

      _formKey.currentState?.save();  // Сохранение данных формы
      _formKey.currentState?.reset();  // Сброс данных формы
    }
  }

  String? _validateEmail(value){
    if(value == '') {
      return 'Enter Email';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _fieldNameCtr,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if(value == '') {
                  return 'Enter Name';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              controller: _fieldEmailCtr,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: _validateEmail,
            ),
            ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: const Text('Send')
            )
          ],
        )
      ),
    );
  }
}
