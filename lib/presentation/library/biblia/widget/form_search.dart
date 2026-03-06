import 'package:flutter/material.dart';
import 'package:lumen/data/models/bible/bible_book.dart';
import 'package:lumen/data/repositories/bible_repository.dart';
import 'package:lumen/data/service/database_service.dart';

class FormSearch extends StatefulWidget {
  const FormSearch({super.key});

  @override
  State<FormSearch> createState() => _FormSearchState();
}

class _FormSearchState extends State<FormSearch> {
  List<BibleBook> books = [];

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    final db = await DatabaseService.instance.database;

    final repo = BibleRepository(db);

    final result = await repo.getBooks();

    setState(() {
      books = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Autocomplete<BibleBook>(
            displayStringForOption: (book) => book.name,

            optionsBuilder: (TextEditingValue textEditingValue) {
              if (books.isEmpty) {
                return const Iterable<BibleBook>.empty();
              }

              if (textEditingValue.text.isEmpty) {
                return books;
              }

              return books.where(
                (book) => book.name.toLowerCase().contains(
                  textEditingValue.text.toLowerCase(),
                ),
              );
            },

            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: "Libro",
                      border: OutlineInputBorder(),
                    ),
                  );
                },

            onSelected: (BibleBook book) {
              print("Libro seleccionado: ${book.abbrev}");
            },
          ),
        ),
      ],
    );
  }
}
