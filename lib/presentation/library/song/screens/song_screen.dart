import 'package:flutter/material.dart';
import 'package:lumen/data/models/song/song_model.dart';
import 'package:lumen/data/repositories/song_repository.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/library/song/widget/song_tile_widget.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

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
        IconButton.filled(onPressed: () {}, icon: Icon(Icons.add)),
        Expanded(
          child: FutureBuilder(
            future: searchAllSong(),
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
                  return SongTileWidget(song: versions[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
