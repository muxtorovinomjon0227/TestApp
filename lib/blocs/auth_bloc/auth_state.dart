part of 'auth_bloc.dart';@immutableabstract class AuthState extends Equatable{}class AuthInitialState extends AuthState {  @override  List<Object?> get props => [];}class AuthLoadedState extends AuthState {  @override  List<Object?> get props => [];}class AuthSuccsessState extends AuthState {  @override  List<Object?> get props => [];}class AuthExceptionState extends AuthState {   final String message;   AuthExceptionState({required this.message});  @override  List<Object?> get props => [message];}class AuthDioErrorState extends AuthState {   final String message;   AuthDioErrorState({required this.message});  @override  List<Object?> get props => [message];}