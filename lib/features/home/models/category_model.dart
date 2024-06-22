class CategoriesModel {
  final String? categoryId;
  final String? categoryName;
  final String? imagePath;

  CategoriesModel(
      {required this.categoryId,
      required this.categoryName,
      required this.imagePath});
  factory CategoriesModel.fromJson(Map<String, dynamic> res) {
    return CategoriesModel(
      categoryId: res['id'] ?? '',
      categoryName: res["name"] ?? '',
      imagePath: res['image'] ?? '',
    );
  }
}
