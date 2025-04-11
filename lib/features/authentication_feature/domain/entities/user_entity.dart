class UserEntity {
  final String userEmail;
  final String userName;
  final String userId;

  UserEntity({
    required this.userEmail,
    required this.userName,
    required this.userId,
  });
  
  toMap() => {'userEmail': userEmail, 'userName': userName, 'userId': userId};
}
