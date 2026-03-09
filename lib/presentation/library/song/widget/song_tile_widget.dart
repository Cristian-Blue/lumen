import 'package:flutter/material.dart';
import 'package:lumen/data/models/song/song_model.dart';

class SongTileWidget extends StatelessWidget {
  final SongModel song;
  const SongTileWidget({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.music_note, color: Colors.white54),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        song.author ?? '',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.play_arrow, color: Colors.white54),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.delete_forever_rounded, color: Colors.white54),
                Icon(Icons.edit, color: Colors.white54),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
