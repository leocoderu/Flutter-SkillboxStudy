import 'package:flutter/material.dart';
import 'package:albums_route/pages/artist_page.dart';
import 'package:albums_route/menu/item_menu.dart';

class HomePage extends StatelessWidget {
  static const namePage = '/';
  const HomePage({Key? key}) : super(key: key);

  static const List<ItemMenu> menu = [
    ItemMenu(icon: Icons.home, title: 'Home', route: HomePage.namePage, active: true,),
    ItemMenu(icon: Icons.person_pin, title: 'Artists', route: ArtistPage.namePage,),
    //ItemMenu(icon: Icons.not_listed_location_outlined, title: 'Another place', route: '/unknown',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      drawer: Drawer(
        //backgroundColor: Colors.red,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...menu.map((e) => e),
              ],
            ),
          )
        )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("Описание ДЗ:\nСамостоятельно постройте навигацию и напишите анимацию перехода между экранами.\n\t\t"
                "● Создайте приложение и выберите подход для построения навигации. Вы можете использовать как "
                "стандартные возможности flutter (onGenerateRoute), так и библиотеку для построения роутинга Fluro "
                "или любую другую библиотеку.\n\t\t"
                "● В приложении должен присутствовать Drawer с двумя роутами Home, Artists. На экране artists "
                "отобразите список c данными из JSON-файла (artists.json), который находится в папке assets. "
                "По клику на элемент списка отобразите детальную страницу артиста. "
                "В AppBar title отобразите имя исполнителя, а на страницу выведите информацию из поля about. "
                "Также в Drawer текущий роут должен быть подсвечен синим цветом. На детальной странице должен "
                "присутствовать AppBar со стрелкой назад.\n\n"
                "Рекомендации по выполнению:\n"
                "Для получения файла с данными можно воспользоваться функцией fetchFileFromAssets, "
                "которая находится в файле fetch_file.dart.\n\n"
                "Критерии выполнения:\n\t\t"
                "● Приложение корректно запускается. Отсутствуют ошибки в консоли.\n\t\t"
                "● На экране albums отображается список артистов, при клике происходит переход на детальную страницу "
                "артиста.\n\t\t"
                "● На детальной странице в AppBar отображается имя артиста, а на экране видна информация из поля about."
            ),
          ],
        ),
      ),
    );
  }
}
