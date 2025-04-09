import 'package:get_it/get_it.dart';
import 'package:spotify_2/data/repository/auth_repository_impl.dart';
import 'package:spotify_2/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_2/domain/entities/auth/auth.dart';
import 'package:spotify_2/domain/usecases/auth/signup.dart';
// import 'package:spotify_2/domain/usecases/signin.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(sl<AuthFirebaseService>()), // Ensure constructor matches
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(sl<AuthRepository>()), // Ensure constructor matches
  );

  // sl.registerSingleton<SigninUseCase>(
  //   SigninUseCase(sl<AuthRepository>()), // Ensure constructor matches
  // );
}
