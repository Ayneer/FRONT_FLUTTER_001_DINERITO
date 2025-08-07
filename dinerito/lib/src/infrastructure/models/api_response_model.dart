class ApiResponseModel {
  final int statusCode;
  final Map<String, dynamic> data;

  ApiResponseModel({
    required this.statusCode,
    required this.data,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      statusCode: json['statusCode'] as int,
      data: json['data'] as Map<String, dynamic>,
    );
  }
}
