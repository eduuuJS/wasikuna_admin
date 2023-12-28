class ResponseMutationDomain<T> {
  final String message;
  final bool success;
  final T? data;

  ResponseMutationDomain(
      {required this.message, required this.success, this.data});
}
