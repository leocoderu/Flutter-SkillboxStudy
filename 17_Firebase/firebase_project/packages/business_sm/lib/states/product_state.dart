//TODO: Пока не вижу смысла хранить информацию имеющуюся в БД дополнительно в Состоянии

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:model_sm/model.dart';
//
// abstract class ProductState {}
//
// class SetBought extends ProductState {
//   final bool bought;
//   SetBought(this.bought);
// }
//
// class SetPrice extends ProductState {
//   final double price;
//   SetPrice(this.price);
// }
//
// class SetCurrency extends ProductState {
//   final int currency;
//   SetCurrency(this.currency);
// }
//
// class SetQuantity extends ProductState {
//   final double quantity;
//   SetQuantity(this.quantity);
// }
//
// class SetUnit extends ProductState {
//   final int unit;
//   SetUnit(this.unit);
// }

// class ProductBloc extends Bloc<ProductState, Product>{
//   ProductBloc() : super(Product(place: ""))  {
//     on<SetBought>((event, emit) => emit(state.copyWith(bought: event.bought)));
//     on<SetCurrency>((event, emit) => emit(state.copyWith(currency: event.currency)));
//     on<SetPrice>((event, emit) => emit(state.copyWith(price: event.price)));
//     on<SetQuantity>((event, emit) => emit(state.copyWith(quantity: event.quantity)));
//     on<SetUnit>((event, emit) => emit(state.copyWith(unit: event.unit)));
//   }
// }
