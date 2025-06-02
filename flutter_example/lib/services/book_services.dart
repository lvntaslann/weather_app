import 'package:flutter/material.dart';

import '../model/book.dart';

class BookServices with ChangeNotifier {
  final List<Book> booksList = Book.sampleBooks();


  List<Book> getBooks(){
    return booksList;
  }

  void addBook(String title, String author, int pageCount) {
    booksList.add(Book(
      id: booksList.length.toString() + 1.toString(),
      title: title,
      author: author,
      pageCount: pageCount,
    ));
    notifyListeners();
  }

void deleteBookById(String id) {
  booksList.removeWhere((book) => book.id == id);
  notifyListeners();
}

  void toggleReadStatus(int index) {
    if (index >= 0 && index < booksList.length) {
      booksList[index].isRead = !booksList[index].isRead;
      notifyListeners();
    } else {
      throw RangeError('Index out of range');
    }
  }

  void updateBook(int index, String title, String author, int pageCount) {
    if (index >= 0 && index < booksList.length) {
      booksList[index] = Book(
          author: author,
          title: title,
          pageCount: pageCount,
          id: booksList[index].id);
    } else {
      throw RangeError('Index out of range');
    }
    notifyListeners();
  }
}
