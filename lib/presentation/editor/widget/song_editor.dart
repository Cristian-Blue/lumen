import 'package:flutter/material.dart';
import 'package:lumen/data/repositories/song/song_repository.dart';
import 'package:lumen/data/service/database_service.dart';

class SongEditor extends StatefulWidget {
  const SongEditor({super.key});

  @override
  State<SongEditor> createState() => _SongEditorState();
}

class _SongEditorState extends State<SongEditor> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final lyricsController = TextEditingController();

  List<String> slides = [];

  void generateSlides() {
    final text = lyricsController.text;

    final result = text
        .split(RegExp(r'\n\s*\n')) // doble enter
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    setState(() {
      slides = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editor de Canción")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Título",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: authorController,
              decoration: const InputDecoration(
                labelText: "Autor",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Letra",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 5),

            TextField(
              controller: lyricsController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText:
                    "Escribe la letra...\nUsa doble Enter para separar slides",
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => generateSlides(),
            ),

            const SizedBox(height: 20),

            const Text(
              "Slides",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  if (newIndex > oldIndex) {
                    newIndex--;
                  }

                  final item = slides.removeAt(oldIndex);
                  slides.insert(newIndex, item);

                  setState(() {});
                },
                children: [
                  for (int i = 0; i < slides.length; i++)
                    Card(
                      key: ValueKey(i),
                      child: ListTile(
                        title: Text(slides[i], textAlign: TextAlign.center),
                        subtitle: Text("Slide ${i + 1}"),
                      ),
                    ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: saveSong,
              child: const Text("Guardar canción"),
            ),
          ],
        ),
      ),
    );
  }

  void saveSong() async {
    final title = titleController.text;
    final author = authorController.text;
    if (title.isEmpty || slides.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Debes ingresar un título y letra")),
      );
      return;
    }

    final db = await DatabaseService.instance.database;
    final repo = SongRepository(db);

    final bool result = await repo.addSong(title, author, slides);

    if (result) {
      /// limpiar formulario
      setState(() {
        titleController.clear();
        authorController.clear();
        lyricsController.clear();
        slides = [];
      });

      /// mensaje de confirmación
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Canción guardada correctamente")),
        );
      }
    }
  }
}
