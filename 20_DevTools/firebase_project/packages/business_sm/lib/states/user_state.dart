// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Layers
import 'package:model/model.dart';

abstract class UserState {}

class SetAuth extends UserState {
  final bool auth;
  SetAuth(this.auth);
}

class SetEmail extends UserState {
  final String email;
  SetEmail(this.email);
}

class UserBloc extends Bloc<UserState, UserModel>{
  UserBloc() : super(UserModel(uid: '', auth: false, email: '', userName: '', avatarUrl: ''))  {
    on<SetAuth>((event, emit) => emit(state.copyWith(auth: event.auth)));
    on<SetEmail>((event, emit) => emit(state.copyWith(email: event.email)));
  }
}
