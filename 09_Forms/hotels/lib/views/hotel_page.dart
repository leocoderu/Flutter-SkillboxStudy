import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';

import 'package:hotels/models/hotel_detailed.dart';

class HotelPage extends StatefulWidget {
  static const routeName = '/hotel';

  final String uuid;
  const HotelPage({Key? key, required this.uuid}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  bool isLoading = false;
  String errMsg = '';
  late HotelDetailed hotel;

  Dio dio = Dio();                      // Объект подключения Dio

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    setState(() => isLoading = true);
    try {
      final response = await dio.get('https://run.mocky.io/v3/${widget.uuid}');
      hotel = HotelDetailed.fromJson(response.data);
    } on DioError catch(err) {
      setState(() {
        errMsg = err.response!.data['message'].toString(); // Записывает тект ошибки
      });
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (!isLoading && errMsg == '') ? Text(hotel.name) : const Text(''),
        centerTitle: true,
      ),
      body: (isLoading) ? Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: const [Center(child: CircularProgressIndicator())])
          : errMsg != '' ? Center(child: Text(errMsg))
          : Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                  ),
                  items: hotel.photos.map((item) =>
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                            child: Stack(
                              children: <Widget>[
                                Image.asset('assets/images/$item', fit: BoxFit.cover, width: 1000.0),
                              ],
                            )),
                      )).toList(),
              ),

              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ItemAbout(title: 'Страна: ', value: hotel.address['country']),
                      ItemAbout(title: 'Город: ', value: hotel.address['city']),
                      ItemAbout(title: 'Улица: ', value: hotel.address['street']),
                      ItemAbout(title: 'Рейтинг: ', value: hotel.rating.toString()),

                      Container(
                        padding: const EdgeInsets.only(top: 15.0),
                        alignment: Alignment.topLeft,
                        child: const Text('Сервисы', style: TextStyle(fontSize: 18)),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: ItemService(title: 'Платные', value: hotel.services['paid'])),
                          Expanded(child: ItemService(title: 'Бесплатно', value: hotel.services['free']))
                        ],
                      ),
                    ],
                  )
              )
           ],
          )
    );
  }
}

class ItemAbout extends StatelessWidget {
  final String title;
  final String value;
  const ItemAbout({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Container(alignment: Alignment.topLeft, child: Text(title, style: const TextStyle(fontSize: 12))),
          Container(alignment: Alignment.topLeft, child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
        ],
      ),
    );
  }
}

class ItemService extends StatelessWidget {
  final String title;
  final List<dynamic> value;
  const ItemService({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
            alignment: Alignment.topLeft,
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
        ),
        ...value.map((e) =>
            Container(
                alignment: Alignment.topLeft,
                child: Text(e, style: const TextStyle(fontSize: 12), textAlign: TextAlign.left)
            )
        ).toList()
      ],
    );
  }
}
