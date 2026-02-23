import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        border: Border(bottom: BorderSide(color: Colors.black26)),
      ),
      child: Row(
        children: [
          Text(
            "Lumen",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20),
          TextButton(
            onPressed: () {},
            child: Text("Biblioteca", style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Presentación",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          Spacer(),
          Icon(Icons.settings, color: Colors.white70),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
