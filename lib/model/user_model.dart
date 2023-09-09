class User {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic username;
  dynamic email_verified_at;
  dynamic created_at;
  dynamic updated_at;
  dynamic deleted_at;
  dynamic entreprise_id;
  dynamic photo;
  User();
  User.fromJosn(dynamic json)
      : id = json['id'] as int,
        name = json['name'] ?? "",
        email = json['email'] ?? "",
        username = json['username'] ?? "",
        email_verified_at = json['email_verified_at'] ?? "",
        created_at = json['created_at'] ?? "",
        updated_at = json['updated_at'] ?? "",
        deleted_at = json['deleted_at'] ?? "",
        entreprise_id = json['entreprise_id'] ?? "",
        photo = json['photo'] ?? "";
  // User.fromJosn();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    data['entreprise_id'] = entreprise_id;
    data['deleted_at'] = deleted_at;
    data['updated_at'] = updated_at;
    data['created_at'] = created_at;
    data['email_verified_at'] = email_verified_at;
    data['username'] = username;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}
