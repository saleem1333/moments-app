/// A class that represents the general failures/errors in the app
class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() {
    return "Failure: $message";
  }
}
