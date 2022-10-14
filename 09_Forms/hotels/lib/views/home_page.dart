import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:hotels/models/hotel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool listView = true;                 // Состояние отображения элементов вьюхи
  bool isLoading = false;               // Состояние загрузки данных из сети
  String errMsg = '';                   // Сообщение ошибки, если она есть
  late List<Hotel> hotels;              // Репозиторий загруженных отелей

  Dio dio = Dio();                      // Объект подключения Dio

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    //ignore: avoid_print
    print(listView);
  }

  _listview(bool state){
    setState(() {
      listView = state;
    });
  }

  getData() async {
    setState(() => isLoading = true);

    try {
      final response = await dio.get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      hotels = response.data.map<Hotel>((hotel) => Hotel.fromJson(hotel)).toList();
    } on DioError catch(err){
      setState(() =>errMsg = err.response!.data['message']); // Записывает тект ошибки
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {_listview(true);},
              icon: const Icon(Icons.list),
          ),
          IconButton(
              onPressed: () {_listview(false);},
              icon: const Icon(Icons.apps),
          ),
        ],
      ),
      body: isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : (errMsg != '') ? Center(child: Text(errMsg))
          : ListView(
              children: [
                ...hotels.map((e) {
                  return ListTile(
                    title: Text(e.name),
                    subtitle: Text(e.poster),
                  );
                }).toList(),
              ],
            )
    );
  }
}
