import 'package:flutter/material.dart';
import 'package:lumen/data/models/bible/bible_book.dart';

class AutocompleteCustom extends StatelessWidget {
  final List<BibleBook> books;
  final void Function(String) onChange;

  const AutocompleteCustom({
    super.key,
    required this.books,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<BibleBook>(
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
          (
            BuildContext context,
            TextEditingController controller,
            FocusNode focusNode,
            VoidCallback onEditingComplete,
          ) {
            return TextField(
              controller: controller,
              focusNode: focusNode,

              /// 👇 limpia el campo cuando se hace click
              onTap: () {
                controller.clear();
              },

              decoration: const InputDecoration(
                labelText: "Libro",
                border: OutlineInputBorder(),
              ),
            );
          },

      onSelected: (BibleBook book) {
        onChange(book.abbrev);
      },
    );
  }
}
