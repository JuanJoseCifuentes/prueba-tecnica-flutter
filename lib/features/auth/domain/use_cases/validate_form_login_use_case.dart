
import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../../../core/generic_use_case.dart';
import '../../infrastructure/models/login_request.dart';
import '../entities/exceptions/validate_form_login_failures.dart';

class ValidateLoginFormUseCase implements UseCase<Either<Map<String, Failure>, bool>, LoginRequest> {
  @override
  Future<Either<Map<String, Failure>, bool>> call({LoginRequest? params}) async {
    Map<String, Failure> errors = {};

    if (!RegExp(RegexValidations.emailPattern).hasMatch(params!.email)) {
      errors['email'] = InvalidEmailFailure();
    }
    /*
    if (params.password.length < 6) {
      errors['password'] = 'La contraseña debe tener al menos 6 caracteres';
    }
     */

    return errors.isEmpty ? const Right(true) : Left(errors);
  }
}

class RegexValidations {
  static const String otpPattern = r'^\d{6}$';
  static const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}';
  static const String familyCodePattern = r'^[a-zA-Z0-9]{1,30}$';
  static const String phoneNumber = r'^\+\d{2}\d{3,20}$';
  static const String namePattern = r'^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]{1,150}$';
}

