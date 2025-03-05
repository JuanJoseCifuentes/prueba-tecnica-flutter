
import '../../../../core/failure.dart';

abstract class FormValidationState{}

class FormInitial extends FormValidationState {
}

class FormLoading extends FormValidationState{
}
  
class FormInvalid extends FormValidationState {

  final Map<String, Failure> validationErrors;
  
  FormInvalid(this.validationErrors);
}

class FormValid extends FormValidationState {
}