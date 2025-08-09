import '../../configuration/interfaces/din_model_interface.dart';

class UserEntity implements DinModelInterface<UserEntity> {
  const UserEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.role,
    this.img,
  });

  final String id;
  final String name;
  final String lastName;
  final String email;
  final String role;
  final String? img;

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      img: map['img'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "lastName": lastName,
      "email": email,
      "role": role,
      "img": img,
    };
  }
}
