import 'package:flutter/material.dart';
import 'package:lumen/domain/models/sermon/sermon_model.dart';
import 'package:lumen/presentation/library/sermon/widget/card_widget.dart';

List<SermonModel> sermons = [
  SermonModel(
    date: DateTime(2025, 1, 1),
    title: 'temporal',
    id: '1',
    description: 'temporal :)',
    preacher: 'cristian',
    slides: List.empty(),
    tags: ['hash'],
  ),
  SermonModel(
    date: DateTime(2025, 1, 1),
    title: 'temporal',
    id: '2',
    description: 'temporal d',
    preacher: 'cristian',
    slides: List.empty(),
    tags: ['hash'],
  ),
];

class PredicacionScreen extends StatelessWidget {
  const PredicacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sermons.length,
      itemBuilder: (context, index) => CardWidget(sermon: sermons[index]),
    );
  }
}
