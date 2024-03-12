abstract class Failure {
  final String message;

  Failure({required this.message});
}

class SomeSpecificError extends Failure {
  SomeSpecificError({required String message}) : super(message: message);
}
