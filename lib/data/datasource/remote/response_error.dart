class ResponseError {
  final String? name, message, stack;
  final int? code;

  ResponseError({this.code, this.name, this.message, this.stack});

  factory ResponseError.fromJson(Map<String, dynamic> json) {
    return ResponseError(
      code: json['code'],
      name: json['name'],
      message: json['message'],
      stack: json['message'],
    );
  }
}
