import 'package:flutter/material.dart';
import 'package:lumen/data/models/song/song_model.dart';
import 'package:lumen/data/repositories/song/song_repository.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/library/song/widget/song_tile_widget.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late Future<List<SongModel>> songsFuture;

  @override
  void initState() {
    super.initState();
    songsFuture = searchAllSong();
  }

  void reloadSongs() {
    setState(() {
      songsFuture = searchAllSong();
    });
  }

  Future<List<SongModel>> searchAllSong() async {
    final db = await DatabaseService.instance.database;
    final repo = SongRepository(db);
    return repo.getSongs();
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
            child: Text('Agregar cancion'),
            style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Esquinas cuadradas
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: songsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (!snapshot.hasData) {
                return const Center(child: Text("No hay datos"));
              }
              final List<SongModel> versions = snapshot.data ?? [];
              return ListView.builder(
                itemCount: versions.length,
                itemBuilder: (context, index) {
                  return SongTileWidget(
                    song: versions[index],
                    onDelete: reloadSongs,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
