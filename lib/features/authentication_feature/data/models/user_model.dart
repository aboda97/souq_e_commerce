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
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    userEmail: json['userEmail'] as String,
  );

  factory UserModel.fromEntity(UserEntity userEntity) => UserModel(
    userId: userEntity.userId,
    userName: userEntity.userName,
    userEmail: userEntity.userEmail,
  );

  toMap() => {'userEmail': userEmail, 'userName': userName, 'userId': userId};
}
