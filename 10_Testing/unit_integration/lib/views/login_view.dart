import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool successMessage = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _submit(){
    setState(() {
      successMessage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            if (successMessage) const Text('Вы успешно зарегистрировались'),
            TextFormField(
              key: const Key('fieldEmail'),
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              key: const Key('fieldPhone'),
              keyboardType: TextInputType.number,  // phone
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            ElevatedButton(
              //key: const Key('buttonSubmit'),
              onPressed: _submit,
              child: const Text('Submit')
            )
          ],
        ),
      ),
    );
  }
}
