class ResponseHandler {
  bool isSuccess = false;
  dynamic response;
  dynamic error;
  String? message;

  ResponseHandler(
      {
      this.error,
      this.isSuccess = false,
      this.message,
      this.response});

  @override
  String toString() {
    return 'ResponseHandler{isSuccess: $isSuccess, response: $response, error: $error, message: $message}';
  }
}

