enum StateStatus {
  initial,
  loading,
  success,
  failure,
  notFound,
  empty,
}

extension StateStatusX on StateStatus {
  bool get isInitial => this == StateStatus.initial;
  bool get isLoading => this == StateStatus.loading;
  bool get isSuccess => this == StateStatus.success;
  bool get isFailure => this == StateStatus.failure;
  bool get isNotFound => this == StateStatus.notFound;
  bool get isEmpty => this == StateStatus.empty;
}
