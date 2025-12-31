class CategoryModel {
  final String id;
  final String count;

  CategoryModel({required this.id, required this.count});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['_id'] as String, count: json['count'].toString());
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'count': count};
  }

  CategoryModel copyWith({String? id, String? count}) {
    return CategoryModel(id: id ?? this.id, count: count ?? this.count);
  }
}
