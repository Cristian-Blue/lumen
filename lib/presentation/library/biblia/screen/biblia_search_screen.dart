import 'package:flutter/material.dart';
import 'package:lumen/data/models/bible/bible_verse.dart';
import 'package:lumen/data/repositories/bible/bible_repository.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/library/biblia/widget/form_search.dart';

class BibliaSearchScreen extends StatefulWidget {
  final String version;

  const BibliaSearchScreen({super.key, required this.version});

  @override
  State<BibliaSearchScreen> createState() => _BibliaSearchScreenState();
}

class _BibliaSearchScreenState extends State<BibliaSearchScreen> {
  List<BibleVerse> verseList = [];

  void onChange(String book, int chapter, String verse) async {
    final db = await DatabaseService.instance.database;
    final repo = BibleRepository(db);
    final result = verse == ''
        ? await repo.getChapter(
            book: book,
            chapter: chapter,
            version: widget.version,
          )
        : await repo.getVerse(
            book: book,
            chapter: chapter,
            verse: int.parse(verse),
            version: widget.version,
          );

    setState(() {
      verseList = result;
    });
  }

  void view() {
    print('view');
  }

  void edit() {
    print('edid');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormSearch(version: widget.version, onChange: onChange),
        Expanded(
          child: ListView.builder(
            itemCount: verseList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onDoubleTap: () => view(),
                onTap: () => edit(),
                child: ListTile(
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${verseList[index].chapter}:${verseList[index].verse} ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: verseList[index].text),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
