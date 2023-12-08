import 'dart:async';

class AppStreamController {
  final controllerLogin = StreamController<bool>();
  Sink<bool> get inputLoadingBool => controllerLogin.sink;
  Stream<bool> get outputLoadingBool => controllerLogin.stream;

  final controllerAuth = StreamController<bool>();
  Sink<bool> get inputLoadingBoolAuth => controllerAuth.sink;
  Stream<bool> get outputLoadingBoolAuth => controllerAuth.stream;


}
