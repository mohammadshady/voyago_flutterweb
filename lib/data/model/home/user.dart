class UserModel {
  int? id;
  String? email;
  String? englishName;
  String? mobile;
  String? status;
  String? createdAt;

  UserModel(
      {this.id, this.email, this.englishName, this.mobile, this.status, this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    englishName = json['english_name'];
    mobile = json['mobile'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['english_name'] = this.englishName;
    data['mobile'] = this.mobile;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}