import 'package:flutter/material.dart';

class SelectCustom extends StatefulWidget {
  final int maxChapters;
  final String text;
  final void Function(int?) onChange;

  const SelectCustom({
    super.key,
    required this.maxChapters,
    required this.text,
    required this.onChange,
  });

  @override
  State<SelectCustom> createState() => _SelectCustomState();
}

class _SelectCustomState extends State<SelectCustom> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: widget.text,
        border: OutlineInputBorder(),
      ),
      items: List.generate(
        widget.maxChapters,
        (index) =>
            DropdownMenuItem(value: index + 1, child: Text("${index + 1}")),
      ),
      onChanged: (value) {
        widget.onChange(value);
      },
    );
  }
}
