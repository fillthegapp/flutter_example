abstract class FormSubmissionState {
  const FormSubmissionState();
}

class FormCheckingState extends FormSubmissionState {}

class FormInitialState extends FormSubmissionState {}

class FormBiometricState extends FormSubmissionState {}

class FormInvalidUser extends FormSubmissionState {}

class FormInvalidPin extends FormSubmissionState {}

class FormSubmittingState extends FormSubmissionState {}

class FormSubmitSuccessState extends FormSubmissionState {}

class FormSubmitFailedState extends FormSubmissionState {
  final Exception exception;
  FormSubmitFailedState(this.exception);
}
