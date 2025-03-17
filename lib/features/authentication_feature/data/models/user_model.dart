import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userEmail,
    required super.userName,
    required super.userId,
  });

  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      userId: user.uid,
      userEmail: user.email ?? '',
      userName: user.displayName ?? '',
    );
  }
}
