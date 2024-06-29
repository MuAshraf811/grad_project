class CartModel {
  final String productName;
  final int quantity;
  final String producrId;
  final String itemId;
  final String image;

  CartModel({
    required this.productName,
    required this.quantity,
    required this.producrId,
    required this.itemId,
    required this.image,
  });

  factory CartModel.fromJson(Map<String, dynamic> res) {
    return CartModel(
        productName: res['product_name'],
        quantity: res['quantity'],
        itemId: res['id'],
        image: res['product_image'],
        producrId: res['id']);
  }
}
