import 'package:dartz/dartz.dart';

import '../../domain/entities/exceptions/login_exceptions.dart';
import '../../domain/repositories/auth.dart';
import '../models/login_request.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<LoginException, String>> login(LoginRequest loginRequest) async {

    // Aqui va la logica para autenticar al usuario en firebase
    return Right('');
  }
}