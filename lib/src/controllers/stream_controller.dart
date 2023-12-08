import 'dart:async';

class AppStreamController {

  final StreamController<bool> controllerLogin = StreamController<bool>.broadcast();
  Sink<bool> get inputLoadingBool => controllerLogin.sink;
  Stream<bool> get outputLoadingBool => controllerLogin.stream;

  final StreamController<bool> controllerAuth = StreamController<bool>.broadcast();
  Sink<bool> get inputLoadingBoolAuth => controllerAuth.sink;
  Stream<bool> get outputLoadingBoolAuth => controllerAuth.stream;

}
