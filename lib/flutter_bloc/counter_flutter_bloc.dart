import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class FlutterBloc extends Bloc<CounterEvent, CounterState> {
  FlutterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    final _counterState = state;

    if (event is CounterIncrement) {
      yield CounterState(number: _counterState.number + 1);
    } else if (event is CounterDecrement) {
      yield CounterState(number: _counterState.number - 1);
    }
  }
}
