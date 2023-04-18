class User {
  String email;
  String fname;
  String lname;
  String avatar;

  User({
    required this.email,
    required this.fname,
    required this.lname,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fname: json['first_name'],
      lname: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'first_name': fname,
      'last_name': lname,
      'avatar': avatar,
    };
  }
}
