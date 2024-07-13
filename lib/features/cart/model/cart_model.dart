class CartModel {
  final String productName;
  final int quantity;
  final String producrId;
  final String itemId;
  final String image;
  final String price;

  CartModel({
    required this.productName,
    required this.quantity,
    required this.producrId,
    required this.itemId,
    required this.image,
    required this.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> res) {
    return CartModel(
        productName: res['product_name'],
        quantity: res['quantity'],
        price: res['product_final_price'],
        itemId: res['id'],
        image: res['product_image'],
        producrId: res['id']);
  }
}
