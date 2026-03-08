import 'package:flutter/material.dart';

class SelectCustom extends StatelessWidget {
  final int maxChapters;
  final int? value;
  final String text;
  final void Function(int?) onChange;

  const SelectCustom({
    super.key,
    required this.maxChapters,
    required this.text,
    required this.onChange,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: value,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
      ),
      items: List.generate(
        maxChapters,
        (index) =>
            DropdownMenuItem(value: index + 1, child: Text("${index + 1}")),
      ),
      onChanged: onChange,
    );
  }
}
