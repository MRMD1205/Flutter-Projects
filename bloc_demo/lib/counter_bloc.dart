import 'dart:async';

enum CounterActions { Increment, Decrement, Reset }

class CounterBloc {
  int counter = 0;
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get _counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterActions>();

  StreamSink<CounterActions> get eventSink => _eventStreamController.sink;

  Stream<CounterActions> get _eventStream => _eventStreamController.stream;

  CounterBloc() {
    _eventStream.listen((event) {
      if (event == CounterActions.Increment)
        counter++;
      else if (event == CounterActions.Decrement)
        counter--;
      else if (event == CounterActions.Reset) counter = 0;

      _counterSink.add(counter);
    });
  }

  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
