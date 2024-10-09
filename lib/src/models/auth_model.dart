class AuthUser {
  String token;
  String account;

  AuthUser({
    required this.token,
    required this.account,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        token: json['token'] as String,
        account: json['account'] as String,
      );

  Map<String, dynamic> toJson() => <String, String>{
        'token': token,
        'account': account,
      };

  @override
  String toString() => 'AuthUser(token: $token, account: $account)';
}
