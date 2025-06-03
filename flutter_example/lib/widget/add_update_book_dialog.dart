import 'package:flutter/material.dart';
import 'package:flutter_example/services/book_services.dart';

class AddOrUpdateBookDialog extends StatefulWidget {
  final BookServices bookServices;
  final bool isUpdate;
  final int index;
  final String? existingTitle;
  final String? existingAuthor;
  final int? existingPageCount;

  const AddOrUpdateBookDialog({
    super.key,
    required this.bookServices,
    required this.isUpdate,
    required this.index,
    this.existingTitle,
    this.existingAuthor,
    this.existingPageCount,
  });

  @override
  State<AddOrUpdateBookDialog> createState() => _AddOrUpdateBookDialogState();
}

class _AddOrUpdateBookDialogState extends State<AddOrUpdateBookDialog> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _pageCountController;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.existingTitle ?? '');
    _authorController =
        TextEditingController(text: widget.existingAuthor ?? '');
    _pageCountController = TextEditingController(
        text: widget.existingPageCount?.toString() ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _pageCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isUpdate ? "Update Book" : "Add New Book"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Book title'),
          ),
          TextField(
            controller: _authorController,
            decoration: const InputDecoration(labelText: 'Book author'),
          ),
          TextField(
            controller: _pageCountController,
            decoration: const InputDecoration(labelText: 'Page Count'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (widget.isUpdate) {
              widget.bookServices.updateBook(
                widget.index,
                _titleController.text,
                _authorController.text,
                int.parse(_pageCountController.text),
              );
            } else {
              widget.bookServices.addBook(
                _titleController.text,
                _authorController.text,
                int.parse(_pageCountController.text),
              );
            }

            Navigator.pop(context);
          },
          child: Text(widget.isUpdate ? "Update" : "Add"),
        ),
      ],
    );
  }
}
