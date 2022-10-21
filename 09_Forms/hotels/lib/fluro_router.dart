import 'package:fluro/fluro.dart';
import 'package:hotels/views/home_page.dart';
import 'package:hotels/views/hotel_page.dart';
import 'package:hotels/views/not_found_page.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const HomePage();
  });

  static Handler hotelHandler = Handler(handlerFunc: (context, Map<String, dynamic>? params) {
    //print(params);
    if (params != null && params.containsKey('uuid')) {
      //print(params['uuid'][0]);
      return HotelPage(uuid: params['uuid'][0]);
    }
    return const HotelPage(uuid: 'none');
  });

  static void setupRouter(){
    router.define(HomePage.routeName, handler: homeHandler, transitionType: TransitionType.fadeIn);
    //router.define(HotelPage.routeName, handler: hotelHandler, transitionType: TransitionType.inFromLeft);
    router.define('${HotelPage.routeName}/:uuid', handler: hotelHandler, transitionType: TransitionType.inFromLeft);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }

}
