
import '../../../../../core/failure.dart';

class ValidateFormLoginExceptions extends Failure {
  const ValidateFormLoginExceptions(super.message);

  @override
  List<Object?> get props => [message];
}

class WrongPasswordException extends Failure {
  const WrongPasswordException() : super('Contraseña incorrecta. Por favor, inténtelo de nuevo.');
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure() : super('El correo electrónico no es válido.');
}