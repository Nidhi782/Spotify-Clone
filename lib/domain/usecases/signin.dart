// import 'package:dartz/dartz.dart';
// import 'package:spotify_2/data/models/auth/signin_user_req.dart';
// import 'package:spotify_2/domain/entities/auth/auth.dart';


// abstract class UseCase<Type, Params> {
//   Future<Type> call({Params? params});
// }

// class SigninUseCase implements UseCase<Either<String, String>, SigninUserReq> {
//   final AuthRepository authRepository;

//   SigninUseCase(this.authRepository);

//   @override
//   Future<Either<String, String>> call({SigninUserReq? params}) async {
//     if (params == null) {
//       return Left('Invalid parameters');
//     }
//     return await authRepository.signin(params);
//   }
// }
