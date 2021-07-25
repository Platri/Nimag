class Ticker {
  const Ticker();
  Stream<int> timerTick({required int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1);
  }

  Stream<int> nimagCountTick({required int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1);
  }
}
