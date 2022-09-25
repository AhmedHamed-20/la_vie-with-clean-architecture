import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/auth/domain/entities/user_data.dart';

class AuthDataEntitie extends Equatable {
  final String accessToken;
  final String refreshToken;
  final UserDataEntitie userDataEntitie;
  const AuthDataEntitie({
    required this.accessToken,
    required this.refreshToken,
    required this.userDataEntitie,
  });
  @override
  List<Object?> get props => [accessToken, refreshToken, userDataEntitie];
}
