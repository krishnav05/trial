class User {
  // int userId;
  String name;
  String email;
  String mobile;
  String dob;

  // ignore: non_constant_identifier_names
  String license_id;

  // ignore: non_constant_identifier_names
  String license_name;
  String image;
  String token;

  // ignore: non_constant_identifier_names
  User(
      {this.name,
      this.email,
      this.mobile,
      this.dob,
      this.license_id,
      this.license_name,
      this.image,
      this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        // userId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        mobile: responseData['mobile'],
        dob: responseData['dob'],
        license_id: responseData['license_id'],
        license_name: responseData['license_name'],
        image: responseData['image'],
        token: responseData['token']);
  }
}
