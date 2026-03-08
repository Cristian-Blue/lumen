import 'package:flutter/material.dart';
import 'package:lumen/data/models/bible/bible_book.dart';
import 'package:lumen/data/repositories/bible_repository.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/library/biblia/widget/autocomplete_custom.dart';
import 'package:lumen/presentation/library/biblia/widget/select_custom.dart';
import 'package:lumen/presentation/library/biblia/widget/text_custom.dart';

class FormSearch extends StatefulWidget {
  final String version;
  final Function(String, int, String) onChange;

  const FormSearch({super.key, required this.version, required this.onChange});

  @override
  State<FormSearch> createState() => _FormSearchState();
}

class _FormSearchState extends State<FormSearch> {
  List<BibleBook> books = [];
  int countChapter = 0;

  String book = '';
  int chapter = 0;
  String verse = '';

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  Future<void> loadBooks() async {
    final db = await DatabaseService.instance.database;
    final repo = BibleRepository(db);
    final result = await repo.getBooks(widget.version);

    setState(() {
      books = result;
    });
    widget.onChange?.call(book, chapter, verse);
  }

  void change(int? i) {
    setState(() {
      chapter = i ?? 0;
    });
    widget.onChange?.call(book, chapter, verse);
  }

  void changeAuto(String select) async {
    final count = await DatabaseService.instance.database;
    final repo = BibleRepository(count);
    final result = await repo.getChaptersCount(widget.version, select);
    setState(() {
      book = select;
      countChapter = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AutocompleteCustom(books: books, onChange: changeAuto),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SelectCustom(
                text: 'Capitulo',
                maxChapters: countChapter,
                onChange: change,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(child: TextCustom(text: 'Versiculo')),
          ],
        ),
      ],
    );
  }
}
