import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({Key? key, required this.path, required this.name, required this.listView}) : super(key: key);

  final bool listView;          // Вид отображения информации Список или Таблица
  final String path;            // Путь к файлу изображения
  final String name;            // Название отеля

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,       // Обрезаем выступающие края дочерних элементов
      elevation: 10.0,                    // Высота отбрасываемой тени
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Скругление краев
      margin: const EdgeInsets.all(5.0),  // Отступ от края
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 1.7,           // Подрезаем картинку снизу
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topCenter,
                        image: AssetImage('assets/images/$path'),
                      )
                    ),
                  )
          ),
          !listView                       // Если Вид Табличный
          ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 30,
                  child: Center(
                      child: Text(name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12)
                      )
                  ),
                ),
              ),

              SizedBox(
                width: double.maxFinite,    // Растягиваем кнопку по ширине виджета
                height: 30.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  onPressed: () {},
                  child: const Text('Подробнее', style: TextStyle(fontSize: 12)),
                )
              )
            ],
          )
          : Padding(              // Иначе вид списком
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 60.0),
                      child: Text(name, style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2.0))
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(const Size(90, 30))
                    ),
                    onPressed: () {},
                    child: const Text('Подробнее', style: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            )
        ],
      )
    );
  }
}
