import 'package:flutter/material.dart';
import 'package:lumen/presentation/editor/widget/sermon_editor.dart';
import 'package:lumen/presentation/editor/widget/song_editor.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [Expanded(child: SermonEditor())],
    );
  }
}
