import 'package:flutter/material.dart';
import 'package:flutter_example/pages/book/book_detail_page.dart';
import 'package:provider/provider.dart';

import '../../model/book.dart';
import '../../services/book_services.dart';
import '../../widget/add_update_book_dialog.dart';

class BookPage extends StatelessWidget {
  BookPage({Key? key}) : super(key: key);
  final TextEditingController booktitleController = TextEditingController();
  final TextEditingController bookauthorController = TextEditingController();
  final TextEditingController bookpageCountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bookServices = Provider.of<BookServices>(context);
    List<Book> bookList = bookServices.getBooks();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Page'),
      ),
      body: ListView.builder(
        itemCount: bookList.length, // Replace with your book count
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BookDetailPage(book: bookList[index])));
                },
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    color: bookList[index].isRead
                        ? Colors.green[100]
                        : Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(bookList[index].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(bookList[index].author,
                          style: const TextStyle(fontSize: 16)),
                      Text('Page Count: ${bookList[index].pageCount}',
                          style: const TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AddOrUpdateBookDialog(
                                    bookServices: bookServices,
                                    isUpdate: true,
                                    index: index,
                                    existingTitle: bookList[index].title,
                                    existingAuthor: bookList[index].author,
                                    existingPageCount:
                                        bookList[index].pageCount,
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {
                              bookServices.deleteBookById(
                                  bookList[index].id);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddOrUpdateBookDialog(
              bookServices: bookServices,
              isUpdate: false,
              index: -1,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
