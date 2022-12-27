import 'package:business_sm/model/app_state.dart';
import 'package:business_sm/reducer/counter_reducer.dart';
import 'package:business_sm/reducer/theme_reducer.dart';

// Combine many smaller reducers into one
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    counterState: counterReducer(state.counterState, action),
    themeState: themeReducer(state.themeState, action),
  );
}