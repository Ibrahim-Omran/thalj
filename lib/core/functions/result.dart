class Result<T> {
  final T? data;
  final String? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;
}

extension ResultExtensions<T> on Result<T> {
  void handle({
    required void Function(T) success,
    required void Function(String) failure,
  }) {
    if (isSuccess) {
      success(data as T);
    } else if (isFailure) {
      failure(error!);
    }
  }
}