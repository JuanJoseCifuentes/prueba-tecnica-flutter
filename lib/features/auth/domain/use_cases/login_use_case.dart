import 'package:dartz/dartz.dart';

import '../../../../core/injections.dart';
import '../../infrastructure/models/login_request.dart';
import '../entities/exceptions/login_exceptions.dart';
import '../repositories/auth.dart';
import '../../../../core/generic_use_case.dart';

class LoginUseCase implements UseCase<Either, LoginRequest> {

  @override
  Future<Either<LoginException, String>> call({LoginRequest? params}) async {
    // Utiliza el service locator (sl) para obtener la instancia de AuthRepository
    return await sl<AuthRepository>().login(params!);
  }

}
