class UserEntity {
  final String id;
  final String name;
  final String email;
  final String imageURL;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.imageURL, // Ensure this field is present
  });
}
