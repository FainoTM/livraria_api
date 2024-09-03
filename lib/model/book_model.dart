class Book {
  final String title;
  final String description;
  final String author;
  final String price;
  final String publisher;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.publisher,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '0.00',
      publisher: json['publisher'] ?? '',
    );
  }
}
