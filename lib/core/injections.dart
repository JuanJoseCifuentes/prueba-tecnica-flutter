import 'package:get_it/get_it.dart';

import '../features/auth/domain/repositories/auth.dart';
import '../features/auth/domain/use_cases/login_use_case.dart';
import '../features/auth/infrastructure/repositories/auth_repository_impl.dart';
import '../features/auth/presentation/bloc/login_state_cubit.dart';


/// Sl es el contenedor de inyección de dependencias
final sl = GetIt.instance;

Future<void> initInjections() async {
  // Inicializa las inyecciones de dependencias de la aplicación
  sl.registerFactory<LoginStateCubit>(
        () => LoginStateCubit(loginUseCase: sl<LoginUseCase>()),
  );

  sl.registerFactory<LoginUseCase>(
        () => LoginUseCase(),
  );

  sl.registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(),
  );
}