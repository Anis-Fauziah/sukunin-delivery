class Product {

  final int id;
  final String productName;
  final String flavor;
  final String size;
  final double price;
  final String image;
  final String description;

  Product({
    required this.id,
    required this.productName,
    required this.flavor,
    required this.size,
    required this.price,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(
    Map<String, dynamic> json,
  ) {
    return Product(
      id: int.parse(
        json['id'].toString(),
      ),

      productName:
          json['product_name'],

      flavor:
          json['flavor'],

      size:
          json['size'],

      price: double.parse(
        json['price'].toString(),
      ),

      image:
          json['image'],

      description:
          json['description'],
    );
  }
}