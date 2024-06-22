class ProductDetailsModel {
  final String name; //
  final num price; //
  final int quantity; //
  final String company;
  final String discription; //
  final String id; //
  final List<dynamic>? images; //
  final String code; //
  final String categoryName; //
  ProductDetailsModel({
    required this.name,
    required this.id,
    required this.price,
    required this.images,
    required this.discription,
    required this.categoryName,
    required this.quantity,
    required this.code,
    required this.company,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> response) {
    return ProductDetailsModel(
        name: response['name'],
        id: response['id'],
        price: response['price'],
        images: response['images'] ?? '',
        discription: response['description'],
        categoryName: response['category'],
        quantity: response['stock'],
        code: response['code'],
        company: response['factory_company']);
  }
}
