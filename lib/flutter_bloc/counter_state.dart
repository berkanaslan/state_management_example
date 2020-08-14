class CounterState {
  final int number;

  const CounterState({this.number});

  factory CounterState.initial() {
    return CounterState(number: 0);
  }
}
