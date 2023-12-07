import 'dart:async';

class AppStreamController {
  final StreamController<int> controller = StreamController<int>.broadcast();
  Sink<int> get inputNumber => controller.sink;
  Stream<int> get outputNumber => controller.stream;


  void dispose() {
    controller.close();
  }
}
