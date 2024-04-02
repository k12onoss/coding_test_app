import 'package:flutter_bloc/flutter_bloc.dart';

enum SubmissionStatus {
  initial,
  running,
  submitting,
  runSuccess,
  submitSuccess
}

class CodeBloc extends Cubit<SubmissionStatus> {
  CodeBloc() : super(SubmissionStatus.initial);

  void runCode() async {
    emit(SubmissionStatus.running);
    await Future.delayed(const Duration(seconds: 2));
    emit(SubmissionStatus.runSuccess);
  }

  void submitCode() async {
    emit(SubmissionStatus.submitting);
    await Future.delayed(const Duration(seconds: 2));
    emit(SubmissionStatus.submitSuccess);
  }
}
