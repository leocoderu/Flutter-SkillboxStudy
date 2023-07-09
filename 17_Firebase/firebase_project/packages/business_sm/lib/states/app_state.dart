// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hive_flutter/hive_flutter.dart';

// Layers
import 'package:model/model.dart';

abstract class AppState {}

// Enable or Disable Summary Panel on Home Page
class EnableSummaryPanel extends AppState {
  final bool summary_panel;
  EnableSummaryPanel({required this.summary_panel});

  //AppStateModel _appStateModel = AppStateModel(summary_panel: summary_panel);
  //final _shoppingBox = Hive.box<AppStateModel>('shopping_box').put('summary_panel', _appStateModel);
  //_shoppingBox.put(itemKey, item);
}

class AppStateBloc extends Bloc<AppState, AppStateModel>{
  AppStateBloc() : super(AppStateModel(summary_panel: true))  {
    on<EnableSummaryPanel>((event, emit) => emit(state.copyWith(summary_panel: event.summary_panel)));
  }
}