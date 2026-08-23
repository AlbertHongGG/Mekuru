abstract class Result<S, F extends Failure> {
  const Result();

  bool get isSuccess => this is Success<S, F>;
  bool get isFailure => this is Error<S, F>;

  S getOrThrow() {
    if (this is Success<S, F>) {
      return (this as Success<S, F>).value;
    } else {
      throw Exception((this as Error<S, F>).failure.message);
    }
  }

  void fold(
    void Function(S value) onSuccess,
    void Function(F failure) onFailure,
  ) {
    if (this is Success<S, F>) {
      onSuccess((this as Success<S, F>).value);
    } else if (this is Error<S, F>) {
      onFailure((this as Error<S, F>).failure);
    }
  }
}

class Success<S, F extends Failure> extends Result<S, F> {
  final S value;
  const Success(this.value);
}

class Error<S, F extends Failure> extends Result<S, F> {
  final F failure;
  const Error(this.failure);
}

abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}
