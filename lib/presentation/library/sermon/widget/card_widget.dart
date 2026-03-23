import 'package:flutter/material.dart';
import 'package:lumen/data/models/sermon/sermon_model.dart';
import 'package:lumen/data/repositories/sermon/sermon_repository.dart';
import 'package:lumen/data/service/database_service.dart';

class CardWidget extends StatelessWidget {
  final SermonModel sermon;
  final VoidCallback onDelete;

  const CardWidget({super.key, required this.sermon, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    void deleteSermon() async {
      final db = await DatabaseService.instance.database;
      final repo = SermonRepository(db);
      bool result = await repo.deleteSermon(sermon.id);
      if (result) {
        onDelete();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            (result)
                ? 'Predicacion eliminada'
                : 'Error al eliminar la predicacion',
          ),
          backgroundColor: !result ? Colors.red : Colors.green,
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Información
            Row(
              children: [
                const Icon(Icons.mic, size: 40),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        sermon.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sermon.author,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        sermon.date,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// Botones alineados a la derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  tooltip: "Eliminar",
                  icon: const Icon(Icons.delete),
                  onPressed: deleteSermon,
                ),
                IconButton(
                  tooltip: "Editar",
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: "Agregar a escena",
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: "Presentar",
                  icon: const Icon(Icons.play_circle_fill),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
