class CategoryModel {
  String? id;
  String? name;
  CategoryModel({this.id, this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json["name"],
    );
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}
