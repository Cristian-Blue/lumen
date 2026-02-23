import 'package:flutter/material.dart';
import 'package:lumen/presentation/screen/library/widget/song_tile_widget.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const SongTileWidget();
      },
    );
  }
}
