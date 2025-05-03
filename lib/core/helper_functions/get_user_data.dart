import 'dart:convert';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'package:souq_app/features/authentication_feature/data/models/user_model.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';

UserEntity getUserData(){
var jsonString = SharedPreferencesService.getString(kUserData) ?? '' ;
var userEntity = UserModel.fromJson(jsonDecode(jsonString));
return userEntity;
}