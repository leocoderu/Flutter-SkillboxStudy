// // Import Packages
// import 'package:business_layer/business_layer.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CounterBloc extends Bloc<CounterEvent, int>{
//   CounterBloc() : super(locator.get<CounterController>().get()) {
//      on<Increase>((event, emit) {
//        final counter = locator.get<CounterController>().get() + 1;
//        emit(counter);
//        locator.get<CounterController>().set(counter);
//      });
//      on<Decrease>((event, emit) {
//        final counter = locator.get<CounterController>().get() - 1;
//        emit(counter);
//        locator.get<CounterController>().set(counter);
//      });
//   }
// }