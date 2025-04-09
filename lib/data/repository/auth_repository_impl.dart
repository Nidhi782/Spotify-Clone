import 'package:dartz/dartz.dart';
import 'package:spotify_2/data/models/auth/create_user_req.dart';
import 'package:spotify_2/data/models/auth/signin_user_req.dart';
import 'package:spotify_2/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_2/domain/entities/auth/auth.dart';
import 'package:spotify_2/sevice_locator.dart';


class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(AuthFirebaseService authFirebaseService);

  @override
  Future<void> signin(SigninUserReq signinUserReq) async {
  
    await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
   return  await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
