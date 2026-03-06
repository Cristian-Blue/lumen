import 'package:flutter/material.dart';
import 'package:lumen/presentation/library/biblia/widget/form_search.dart';

class BibiliaScreen extends StatelessWidget {
  const BibiliaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormSearch(),
        Expanded(child: Text('lore ipsum')),
      ],
    );
  }
}
