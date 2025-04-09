import 'package:spotify_2/domain/entities/auth/user.dart';
import 'package:spotify_2/utils/app_urls.dart'; // Ensure this file exists

class UserModel {
  final String id;
  final String name;
  final String email;
  String? imageURL;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.imageURL,
  });

  // Convert JSON response from Supabase into a UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      imageURL: json['imageURL'],
    );
  }

  // Convert UserModel to UserEntity (used in domain layer)
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      imageURL: imageURL ?? AppURLs.defaultImage, // Use default image if null
    );
  }
}
