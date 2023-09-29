class UserModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? role;
  bool? success;

  UserModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.role,
    this.success,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        expiresIn: json['expires_in'],
        role: json['role'],
        success: json['success'],
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
        'role': role,
        'success': success,
      };
}
