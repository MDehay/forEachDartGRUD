class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User(this.id, this.email, this.firstName, this.lastName, this.avatar);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        firstName = json["first_name"],
        lastName = json["last_name"],
        avatar = json["avatar"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'avatar': avatar,
      };
}
