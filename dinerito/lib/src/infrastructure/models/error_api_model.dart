class ErrorApiModel {
  ErrorApiModel({
    required this.url,
    required this.message,
    required this.detail,
    required this.code,
  });

  final String url;
  final String message;
  final String detail;
  final String code;

  static ErrorApiModel fromMap(Map<String, dynamic> map) {
    final String message = map['error'] as String;
    final String? detail = map['detail'] as String?;

    return ErrorApiModel(
      url: map['url'] as String,
      message: message,
      detail: detail ?? message,
      code: map['codeError'] as String,
    );
  }
}