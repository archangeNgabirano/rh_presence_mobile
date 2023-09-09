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
  User() {}
  User.fromJosn(dynamic json)
      : this.id = json['id'] as int,
        this.name = json['name'] ?? "",
        this.email = json['email'] ?? "",
        this.username = json['username'] ?? "",
        this.email_verified_at = json['email_verified_at'] ?? "",
        this.created_at = json['created_at'] ?? "",
        this.updated_at = json['updated_at'] ?? "",
        this.deleted_at = json['deleted_at'] ?? "",
        this.entreprise_id = json['entreprise_id'] ?? "",
        this.photo = json['photo'] ?? "";
  // User.fromJosn();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['entreprise_id'] = this.entreprise_id;
    data['deleted_at'] = this.deleted_at;
    data['updated_at'] = this.updated_at;
    data['created_at'] = this.created_at;
    data['email_verified_at'] = this.email_verified_at;
    data['username'] = this.username;
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}
