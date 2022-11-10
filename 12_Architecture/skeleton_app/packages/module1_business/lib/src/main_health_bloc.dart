import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:module1_data/module1_data.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';

//part 'main_health_bloc.freezed.dart';

@injectable
class MainHealthBloc {
  final HealthService healthService;
  final StreamController<int> _eventController = StreamController();

  MainHealthBloc({required this.healthService});

  void add(int event){
    if (_eventController.isClosed) return;
    _eventController.add(event);
  }

  void dispose(){
    _eventController.close();
  }
}