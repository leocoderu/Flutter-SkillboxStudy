import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_sm/model_sm.dart';

abstract class ProductState {}

class SetTemperature extends ProductState {
  final double temp;
  SetTemperature(this.temp);
}

class SetCloudy extends ProductState {
  final double cloudy;
  SetCloudy(this.cloudy);
}

class ProductBloc extends Bloc<ProductState, ProductData>{
  ProductBloc() : super(ProductData(degrees: 0.0, cloudy: 0.0))  {
    on<SetTemperature>((event, emit) => emit(state.copyWith(degrees: event.temp)));
    on<SetCloudy>((event, emit) => emit(state.copyWith(cloudy: event.cloudy)));
  }
}
