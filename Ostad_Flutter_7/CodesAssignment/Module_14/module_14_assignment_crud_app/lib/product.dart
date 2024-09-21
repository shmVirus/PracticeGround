class Product {
  final String id;
  final String productName;
  final String productCode;
  final String productImage;
  final String unitPrice;
  final String quantity;
  final String totalPrice;
  final String createdAt;

  Product({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.productImage,
    required this.unitPrice,
    required this.quantity,
    required this.totalPrice,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productName: json['ProductName'],
      productCode: json['ProductCode'],
      productImage: json['Img'],
      unitPrice: json['UnitPrice'],
      quantity: json['Qty'],
      totalPrice: json['TotalPrice'],
      createdAt: json['createdAt'],
    );
  }
}
