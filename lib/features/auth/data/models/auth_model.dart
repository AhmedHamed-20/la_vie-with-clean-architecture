import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/auth_entitie.dart';

class AuthModel extends AuthDataEntitie {
  const AuthModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
