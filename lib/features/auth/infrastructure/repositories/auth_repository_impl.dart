import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/exceptions/login_exceptions.dart';
import '../../domain/repositories/auth.dart';
import '../models/login_request.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<LoginException, String>> login(LoginRequest loginRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginRequest.email,
          password: loginRequest.password
      );

      return Right("Autenticación Exitosa");

    } on FirebaseAuthException catch (e) {
      String message = "Algo ha salido mal. Revise sus datos y vuelva a intentarlo.";
      if (e.code == 'user-not-found') {
        message = 'El correo no está relacionado con ningún usuario.';
      } else if (e.code == 'wrong-password') {
        message = 'La contraseña no coincide con el correo ingresado.';
      }
      return Left(LoginException(message));
    }
  }
}