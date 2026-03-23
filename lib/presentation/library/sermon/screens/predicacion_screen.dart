import 'package:flutter/material.dart';
import 'package:lumen/data/repositories/sermon/sermon_repository.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/library/sermon/widget/card_widget.dart';
import 'package:lumen/data/models/sermon/sermon_model.dart';

class PredicacionScreen extends StatefulWidget {
  const PredicacionScreen({super.key});

  @override
  State<PredicacionScreen> createState() => _PredicacionScreenState();
}

class _PredicacionScreenState extends State<PredicacionScreen> {
  late Future<List<SermonModel>> sermonFuture;

  @override
  void initState() {
    super.initState();
    sermonFuture = searchAllSong();
  }

  void reloadSermons() {
    setState(() {
      sermonFuture = searchAllSong();
    });
  }

  Future<List<SermonModel>> searchAllSong() async {
    final db = await DatabaseService.instance.database;
    final repo = SermonRepository(db);
    return repo.getSermons();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 25,
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Esquinas cuadradas
              ),
            ),
            child: const Text('Agregar Predicacion'),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: sermonFuture,
            builder: (context, asyncSnapshot) {
              print(asyncSnapshot);
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (asyncSnapshot.hasError) {
                return Center(child: Text(asyncSnapshot.error.toString()));
              }

              if (!asyncSnapshot.hasData) {
                return const Center(child: Text("No hay datos"));
              }
              final List<SermonModel> sermons = asyncSnapshot.data ?? [];
              return ListView.builder(
                itemCount: sermons.length,
                itemBuilder: (context, index) =>
                    CardWidget(sermon: sermons[index], onDelete: reloadSermons),
              );
            },
          ),
        ),
      ],
    );
  }
}
