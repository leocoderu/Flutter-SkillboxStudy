import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_sm/model_sm.dart';

abstract class UserState {}

class SetAuth extends UserState {
  final bool auth;
  SetAuth(this.auth);
}

class SetEmail extends UserState {
  final String email;
  SetEmail(this.email);
}

class UserBloc extends Bloc<UserState, UserData>{
  UserBloc() : super(UserData(auth: false, email: ''))  {
    on<SetAuth>((event, emit) => emit(state.copyWith(auth: event.auth)));
    on<SetEmail>((event, emit) => emit(state.copyWith(email: event.email)));
  }
}