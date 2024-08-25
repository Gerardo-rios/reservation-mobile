class User {
  String token;
  String name;
  String email;
  String username;
  String role;
  String phone;
  String address;
  String photo;

  User({
    required this.token,
    required this.name,
    required this.email,
    required this.username,
    required this.role,
    required this.phone,
    required this.address,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        token: json['token'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        username: json['username'] as String,
        role: json['role'] as String,
        phone: json['phone'] as String,
        address: json['address'] as String,
        photo: json['photo'] as String,
      );

  Map<String, dynamic> toJson() => <String, String>{
        'token': token,
        'name': name,
        'email': email,
        'username': username,
        'role': role,
        'phone': phone,
        'address': address,
        'photo': photo,
      };
}
