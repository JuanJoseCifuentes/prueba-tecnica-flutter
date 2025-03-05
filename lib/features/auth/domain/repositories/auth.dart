import 'package:dartz/dartz.dart';
import '../../infrastructure/models/login_request.dart';
import '../entities/exceptions/login_exceptions.dart';

abstract class AuthRepository {

  Future<Either<LoginException, String>> login(LoginRequest loginRequest);

}
