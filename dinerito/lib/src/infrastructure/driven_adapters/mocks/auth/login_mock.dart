import '../../../models/auth/response/login_response_model.dart';

final Map<String, dynamic> loginMock = {
  "statusCode": 200,
  "data": LoginResponseModel.toMap(
    LoginResponseModel(
      token: 'sjadfvjkafvevnbhesvbubvh34h39',
      user: <String, dynamic>{},
    ),
  ),
};
