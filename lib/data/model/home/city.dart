class CityModel {
  int? id;
  String? name;
  String? englishName;
  String? status;
  String? createdAt;

  CityModel(
      {this.id, this.name, this.englishName, this.status, this.createdAt});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    englishName = json['english_name'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['english_name'] = this.englishName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}