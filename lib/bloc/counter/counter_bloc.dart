import 'dart:async';

import 'package:flutter_state_management/bloc/counter/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  // State için StreamController
  final _counterStateStreamController = StreamController<int>();

  Stream<int> get counter => _counterStateStreamController.stream;
  StreamSink<int> get _counterStateSink => _counterStateStreamController.sink;

  // Eventler için StreamController
  final _counterEventStreamController = StreamController<CounterEvent>();
  Stream<CounterEvent> get _counterEventStream => _counterEventStreamController.stream;
  StreamSink<CounterEvent> get counterEventSink => _counterEventStreamController.sink;

  CounterBloc() {
    _counterEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _counterStateSink.add(_counter);
  }
}
