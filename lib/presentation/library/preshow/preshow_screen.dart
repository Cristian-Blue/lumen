import 'package:flutter/material.dart';

class PreshowScreen extends StatelessWidget {
  const PreshowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF222222),
            border: Border(bottom: BorderSide(color: Colors.black26)),
          ),
          child: const Text(
            "Sesion actual",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Date Previs')],
          ),
        ),
      ],
    );
  }
}
