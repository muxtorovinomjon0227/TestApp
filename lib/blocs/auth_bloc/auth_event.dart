part of 'auth_bloc.dart';@immutableabstract class AuthEvent extends Equatable{}class AuthFetchEvent extends AuthEvent{  @override  List<Object?> get props => [];}class AuthLoginEvent extends AuthEvent{  final String? emile;  final String? password;  AppStreamController controller;  AuthLoginEvent({this.emile, this.password, required this.controller});  @override  List<Object?> get props => [emile,password];}