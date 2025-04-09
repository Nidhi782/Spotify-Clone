import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_2/data/models/auth/create_user_req.dart';
import 'package:spotify_2/data/models/auth/signin_user_req.dart';
import 'package:spotify_2/data/models/user_model.dart';
import 'package:spotify_2/domain/entities/auth/user.dart';
import 'package:spotify_2/utils/app_urls.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



abstract class AuthFirebaseService {
  Future<Either<String, String>> signup(CreateUserReq createUserReq);
  Future<Either<String, String>> signin(SigninUserReq signinUserReq);
  Future<Either<String, UserEntity>> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<Either<String, String>> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right('Signin was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }
      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      
      // Store user data in Supabase
      await supabase.from('Users').insert({
        'id': data.user?.uid,
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });

      return const Right('Signup was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var userId = firebaseAuth.currentUser?.uid;
      if (userId == null) {
        return const Left('User not found');
      }

      var user = await supabase.from('Users').select().eq('id', userId).single();
      
      UserModel userModel = UserModel.fromJson(user);

      userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred');
    }
  }
}
