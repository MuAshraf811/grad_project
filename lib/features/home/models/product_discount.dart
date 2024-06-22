class ProductDiscountModel {
  final String id;
  final num beforePrice;
  final num afterPrice;
  final String startDate;
  final String endDate;
  final String image;
  final String product;
  ProductDiscountModel({
    required this.id,
    required this.beforePrice,
    required this.product,
    required this.afterPrice,
    required this.image,
    required this.startDate,
    required this.endDate,
  });

  factory ProductDiscountModel.fromJson(Map<String, dynamic> res) {
    return ProductDiscountModel(
        id: res['id'],
        image: res['image'],
        beforePrice: res['before_price'],
        product: res['product'],
        afterPrice: res['after_price'],
        startDate: res['start_date'],
        endDate: res['end_date']);
  }
}
