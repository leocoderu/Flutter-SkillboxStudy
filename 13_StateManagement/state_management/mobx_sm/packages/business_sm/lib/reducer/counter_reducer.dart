import 'package:redux/redux.dart';

import 'package:business_sm/actions/counter_actions.dart';
import 'package:business_sm/model/counter_state.dart';

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, CounterIncrementAction>(_increment),
  TypedReducer<CounterState, CounterDecrementAction>(_decrement),
]);

CounterState _increment(CounterState state, CounterIncrementAction action) => state.copyWith(value: state.value + 1);
CounterState _decrement(CounterState state, CounterDecrementAction action) => state.copyWith(value: state.value - 1);
