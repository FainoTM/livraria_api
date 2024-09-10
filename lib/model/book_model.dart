class Book {
  final String title;
  final String description;
  final String price;
  final String image;
  final String buy;

  Book({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.buy,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'] as String,
        description: json['description'] ?? 'Sem descrição',
        price: json['price'] != null ? '\$${json['price']}' : 'Sem preço',
        image: json['book_image'] ?? '',
        buy: json['amazon_product_url'] ?? '');
  }
}
