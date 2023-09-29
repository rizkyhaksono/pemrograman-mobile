class ProfileModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? userName;
  String? email;
  String? fullName;

  ProfileModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userName,
    this.email,
    this.fullName,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        deletedAt: json['deleted_at'],
        userName: json['user_name'],
        email: json['email'],
        fullName: json['full_name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt!.toIso8601String(),
        'updated_at': updatedAt!.toIso8601String(),
        'deleted_at': deletedAt,
        'user_name': userName,
        'email': email,
        'full_name': fullName,
      };
}
