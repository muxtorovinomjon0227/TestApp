import 'dart:async';

class MyStreamControllers{

  final streamController = StreamController<bool>();
  Sink<bool> get dataChek => streamController.sink;
  Stream<bool> get dataStream => streamController.stream;

  final streamControllerRecord = StreamController<bool>();
  Sink<bool> get dataChekRecord => streamControllerRecord.sink;
  Stream<bool> get dataStreamekord => streamControllerRecord.stream;

  final streamControllerPause= StreamController<String>();
  Sink<String> get dataChekPausa => streamControllerPause.sink;
  Stream<String> get dataStreamPausa => streamControllerPause.stream;

  final streamContCall= StreamController<bool>();
  Sink<bool> get dataCallHoldChek => streamContCall.sink;
  Stream<bool> get dataStreamCallHold => streamContCall.stream;

  final streamContFlash= StreamController<bool>();
  Sink<bool> get dataChekFlash => streamContFlash.sink;
  Stream<bool> get dataStreamFlash => streamContFlash.stream;

  final streamPriviePoliciy = StreamController<bool>();
  Sink<bool> get dataPriviePoliciy => streamContFlash.sink;
  Stream<bool> get dataStreamPoliciy => streamContFlash.stream;
}