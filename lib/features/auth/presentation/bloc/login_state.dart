// Definimos el estado del OTP extendiendo LoadingState
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String message; // Respuesta del OTP
  LoginSuccessState(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginFailureState extends LoginState {
  final String failure; // Mensaje de error
  LoginFailureState(this.failure);
  @override
  List<Object?> get props => [failure];
}
