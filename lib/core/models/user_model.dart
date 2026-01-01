class UserModel {
  int id;
  String name;
  String mobile;

  UserModel({required this.id, required this.name, required this.mobile});

  factory UserModel.fromMap(Map data) {
    return UserModel(id: data['id'], name: data['name'], mobile: data['mobile']);
  }

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'mobile': mobile};
}
