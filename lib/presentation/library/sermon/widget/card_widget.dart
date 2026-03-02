import 'package:flutter/material.dart';
import 'package:lumen/domain/models/sermon/sermon_model.dart';

class CardWidget extends StatelessWidget {
  final SermonModel sermon;

  const CardWidget({super.key, required this.sermon});

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      Text(
                        sermon.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sermon.preacher,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "${sermon.date.day}/${sermon.date.month}/${sermon.date.year}",
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
