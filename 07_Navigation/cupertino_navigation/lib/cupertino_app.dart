import 'package:flutter/cupertino.dart';
import 'package:cupertino_navigation/nav_list.dart';
import 'package:cupertino_navigation/pages/home_views.dart';
import 'package:cupertino_navigation/pages/profile_views.dart';

class CupertinoRoute extends StatefulWidget {
  const CupertinoRoute({Key? key}) : super(key: key);

  @override
  State<CupertinoRoute> createState() => _CupertinoRouteState();
}

class _CupertinoRouteState extends State<CupertinoRoute>{
  int _routeIndex = 0;    //  Фиксация текущего индекса вкладки

  late List<GlobalKey<NavigatorState>> navigationKeys; // Список глообальных ключей

  // Ф-ция генерации списка глобальных ключей по списку вкладок
  List<GlobalKey<NavigatorState>> generateNavigationKey() {
    List<GlobalKey<NavigatorState>> navKeys = tabs.map((item) {
      return GlobalKey<NavigatorState>();
    }).toList();
    return navKeys;
  }

  @override
  void initState() {
    super.initState();
    navigationKeys = generateNavigationKey();   // Инициализация списка ключей генеатором
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          //currentIndex: _routeIndex,  // Трудно сказать нокой мы это здесь это сделали,
                                        // скорее всего это управляющий переметр
          onTap: (int index) {
            // Если Вкладку не переключали и индекс тот же, то по нажатию на вкладку срабатывыает возврат
            if(index == _routeIndex && navigationKeys[index].currentState!.canPop()) {
              navigationKeys[index].currentState!.pop();
            }
            _routeIndex = index;  // Фиксируем в переменной текущую вкладку
          },
          items: tabs.map((item) =>
              BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.title,
              )
          ).toList(),
        ),
        tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
                navigatorKey: navigationKeys[index],  // Передаем навигационный ключ таба по индексу
                builder: (BuildContext context) {
                  switch (index){
                    case 0:
                      return const HomeView();
                    case 1:
                      return const ProfileView();
                    default:
                      return const HomeView();
                  }
                }
            );
        }
    );
  }
}
