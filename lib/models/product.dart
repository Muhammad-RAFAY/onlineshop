class Product {
  String title;
  String? description;
  double price;
  String productUrl;

  Product(
      {required this.title,
      this.description,
      required this.price,
      required this.productUrl});
}
