import 'package:dartz/dartz.dart';
import 'package:spotify_2/data/models/auth/create_user_req.dart';
import 'package:spotify_2/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<void> signin(SigninUserReq signinUserReq);
}
