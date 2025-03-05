import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/failure.dart';
import '../../../../core/generic_use_case.dart';
import 'form_validate_state.dart';

class FormValidationCubit extends Cubit<FormValidationState> {
  FormValidationCubit() : super(FormInitial());

  Future<void> validateForm(UseCase validationUseCase, dynamic params) async {
    Either<Map<String, Failure>, bool> validation = await validationUseCase.call(params: params);
    emit(FormLoading());

    validation.fold(
      (errors) => emit(FormInvalid(errors)),
      (success) => emit(FormValid()),
    );
  }
}