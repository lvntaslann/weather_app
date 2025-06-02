import 'package:flutter/material.dart';
import 'package:flutter_example/pages/book/book_detail_page.dart';
import 'package:provider/provider.dart';

import '../../model/book.dart';
import '../../services/book_services.dart';

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
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailPage(book: bookList[index])));
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
                      Text(
                        bookList[index].title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bookList[index].author,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Page Count: ${bookList[index].pageCount}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                _showDialog(context, bookServices, true, index);
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {
                              bookServices.deleteBookById(
                                  bookList[index].id); // id gönderiliyor
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
        onPressed: () async{
           _showDialog(context, bookServices, false, -1);
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context, BookServices bookServices,
      bool isUpdate, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: AlertDialog(
              title: isUpdate ?Text("Update"): Text('Add New Appointment'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: booktitleController,
                    decoration: const InputDecoration(labelText: 'Book title'),
                  ),
                  TextField(
                    controller: bookauthorController,
                    decoration: const InputDecoration(labelText: 'Book author'),
                  ),
                  TextField(
                    controller: bookpageCountController,
                    decoration:
                        const InputDecoration(labelText: 'Pet pageCount'),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isUpdate) {
                        bookServices.updateBook(
                          index,
                          booktitleController.text,
                          bookauthorController.text,
                          int.parse(bookpageCountController.text),
                         
                        );
                      } else {
                        bookServices.addBook(
                          booktitleController.text,
                          bookauthorController.text,
                          int.parse(bookpageCountController.text),
                        );
                      }
                      booktitleController.clear();
                      bookauthorController.clear();
                       Navigator.pop(context);
                    },
                    child: isUpdate ? Text("Update"): Text('Add Appointment'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
