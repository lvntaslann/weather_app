class Book {
  final String id;
  final String title;
  final String author;
  final int pageCount;
  bool isRead;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.pageCount,
    this.isRead = false,
  });

  static List<Book> sampleBooks() {
    return [
      Book(id: '0', title: '1984', author: 'George Orwell', pageCount: 328),
      Book(id: '1', title: 'Sefiller', author: 'Victor Hugo', pageCount: 1463),
    ];
  }
}