import 'package:flutter/material.dart';
import 'package:lumen/data/repositories/sermon/sermon_repository.dart';
import 'package:lumen/data/service/database_service.dart';

class SermonEditor extends StatefulWidget {
  const SermonEditor({super.key});

  @override
  State<SermonEditor> createState() => _SermonEditorState();
}

class _SermonEditorState extends State<SermonEditor> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final sermonController = TextEditingController();
  final tagController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  List<String> slides = [];

  void generateSlides() {
    final text = sermonController.text;

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
      appBar: AppBar(title: const Text("Editor de Sermon")),
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

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: tagController,
                    decoration: const InputDecoration(
                      labelText: "Tag",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Fecha",
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        dateController.text =
                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            const Text(
              "Sermon",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 5),

            TextField(
              controller: sermonController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText:
                    "Escribe la Sermon...\nUsa doble Enter para separar slides",
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
              onPressed: saveSermon,
              child: const Text("Guardar Sermon"),
            ),
          ],
        ),
      ),
    );
  }

  void saveSermon() async {
    final title = titleController.text;
    final author = authorController.text;
    final date = dateController.text;
    final tags = tagController.text;

    if (title.isEmpty || slides.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Debes ingresar un título y descripcion")),
      );
      return;
    }

    final db = await DatabaseService.instance.database;
    final repo = SermonRepository(db);
    final bool result = await repo.addSermon(title, author, date, tags, slides);

    if (result) {
      /// limpiar formulario
      setState(() {
        titleController.clear();
        authorController.clear();
        sermonController.clear();
        tagController.clear();
        dateController.clear();
        slides = [];
      });

      /// mensaje de confirmación
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sermon guardada correctamente")),
        );
      }
    }
  }
}
