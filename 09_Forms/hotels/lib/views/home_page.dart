import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:hotels/models/hotel_preview.dart';
import 'package:hotels/views/hotel_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin{
  bool listView = true;                 // Состояние отображения элементов вьюхи
  bool isLoading = false;               // Состояние загрузки данных из сети
  String errMsg = '';                   // Сообщение ошибки, если она есть
  late List<HotelPreview> hotels;       // Репозиторий загруженных отелей

  Dio dio = Dio();                      // Объект подключения Dio

  @override
  void initState() {
    super.initState();
    _getData();                          // При инициализации загружаем данные из сети
  }

  // Устанавливаем Вид отображения в зависимости от нажатой кнопки в AppBar
  _listview(bool state) => setState(() => listView = state);

  _getData() async {
    setState(() => isLoading = true);
    try {
      final response = await dio.get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      hotels = response.data.map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel)).toList();
    } on DioError catch(err){
      setState(() => errMsg = err.response!.data.toString()); // Записывает тект ошибки
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);    /// Calling build method of mixin
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {_listview(true);}, icon: const Icon(Icons.list)),
          IconButton(onPressed: () {_listview(false);}, icon: const Icon(Icons.apps)),
        ],
      ),

      // drawer: Drawer(     // Для проверки перехвата переадресации в никуда
      //     child: SafeArea(
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: 20.0),
      //           child: ListView(
      //             children: [
      //               ListTile(
      //                 leading: const Icon(Icons.wrong_location),
      //                 title: const Text('Page not Found'),
      //                 onTap: () {Navigator.of(context).pushNamed('routeName');},
      //               ),
      //             ],
      //           ),
      //         )
      //     )
      // ),

      body: isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : (errMsg != '') ? Center(child: Text(errMsg))
          : listView
            ? ListView(
                children: [
                  ...hotels.map((e) {
                    return HotelCard(uuid: e.uuid, path: e.poster, name: e.name, listView: true);
                  })
                ],
              )
            : LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double width = constraints.constrainWidth();
                  return GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: width > 600 ? 1.219 : 1,
                    ),
                    children: [
                      ...hotels.map((e) {
                        return HotelCard(uuid: e.uuid, path: e.poster, name: e.name, listView: false);
                      })
                    ],
                  );
                },
              )
    );
  }

  @override
  bool get wantKeepAlive => true;    /// Overriding the value to preserve the state
}