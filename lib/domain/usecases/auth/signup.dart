import 'package:dartz/dartz.dart';
import 'package:spotify_2/core/usecase/usecase.dart';
import 'package:spotify_2/data/models/auth/create_user_req.dart';
import 'package:spotify_2/domain/entities/auth/auth.dart';
import 'package:spotify_2/sevice_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  SignupUseCase(AuthRepository authRepository);


  @override
  Future<Either> call({CreateUserReq ? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
