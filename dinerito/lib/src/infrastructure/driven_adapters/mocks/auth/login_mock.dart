import '../../../../domain/models/user_model.dart';
import '../../../models/auth/response/login_response_model.dart';

final Map<String, dynamic> loginMock = {
  "statusCode": 200,
  "data": LoginResponseModel(
    token: 'sjadfvjkafvevnbhesvbubvh34h39',
    user: const UserEntity(
      name: 'Ayneer',
      lastName: 'Luis',
      email: 'ayneer12@gmail.com',
      role: 'USER_ADMIN',
      id: 'fjuheofrheofhinoifhjeoip',
    ),
  ).toMap(),
};
