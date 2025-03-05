import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../infrastructure/models/login_request.dart';
import 'login_state.dart';

class LoginStateCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginStateCubit({required this.loginUseCase})
      : super(LoginInitialState());

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoadingState());
    try {
      final result = await loginUseCase.call(params: loginRequest);
      result.fold(
        (failure) => emit(LoginFailureState(failure.message)),
        (response) => emit(LoginSuccessState(response)),
      );
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }
}
