import 'package:flutter/material.dart';
import 'package:flutter_example/model/book.dart';
import 'package:flutter_example/services/book_services.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;
const BookDetailPage({ Key? key, required this.book }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final bookServices = Provider.of<BookServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Title: ${book.title}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Author: ${book.author}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Page Count: ${book.pageCount}',
              style: const TextStyle(fontSize: 18),
            ),
            IconButton(
                      icon: Icon(book.isRead
                          ? Icons.check_circle
                          : Icons.circle_outlined),
                      onPressed: () {
                        bookServices.toggleReadStatus(bookServices.booksList.indexOf(book));
                      },
                    ),
          ],
        ),
      ),
    );
  }
}