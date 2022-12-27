import 'package:reduxdemo/model/app_state.dart';

import 'login_reducer.dart';

// Combine many smaller reducers into one
AppState appReducer(AppState state, action) {
  return AppState(
    userState: loginReducer(state.userState, action),
  );
}
