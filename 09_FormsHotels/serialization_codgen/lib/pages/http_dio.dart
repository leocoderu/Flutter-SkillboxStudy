import 'package:flutter/material.dart';
import 'package:serialization_codgen/user.dart';
import 'package:dio/dio.dart';

class HTTPDIO extends StatefulWidget {
  const HTTPDIO({super.key});

  @override
  State<HTTPDIO> createState() => _HTTPDIOState();
}

class _HTTPDIOState extends State<HTTPDIO> {
  bool isLoading = false;
  bool hasError = false;
  String errorMessage = '';
  late List<User> users;

  Dio dio = Dio();

  @override
  initState(){
    super.initState();
    getDataDio();
  }

  getDataDio() async {
    setState(() {
      isLoading = true;
    });

    try {
      //final response = await dio.get('https://run.mocky.io/v3/af5ffb01-5cc0-4b87-95b5-47b0fcce1c96');
      //final response = await dio.get('https://run.mocky.io/v3/623146b4-32ea-49ca-87ca-9ea4cd2dcc9b');
      final response = await dio.get('https://run.mocky.io/v3/ef893a53-ca8c-4d3c-ae87-f727b8420681');
      //final response = await dio.get('https://run.mocky.io/v3/e4e4904b-7ca8-4893-9caa-d5ea304f0f51');
      users = response.data.map<User>((user) => User.fromJson(user)).toList();
    } on DioError catch(e){
      //print(e.error);
      setState((){
        hasError = true;
        errorMessage = e.response!.data['message'];
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP DIO'),
        centerTitle: true,
      ),
      body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
            )
            : hasError ? Center(child: Text(errorMessage))
            : ListView(
              children: <Widget>[
                ...users.map((user) {

                    return  ListTile(
                      title: Text(user.email),
                      subtitle: Text(user.name),
                    );

                }).toList(),

              ],
            )
    );
  }
}
