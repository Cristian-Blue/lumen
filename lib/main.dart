import 'package:flutter/material.dart';
import 'package:lumen/core/theme/theme.dart';
import 'package:lumen/presentation/screen/home/home_screen.dart';

void main() {
  runApp(Lumen());
}

class Lumen extends StatelessWidget {
  const Lumen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lumen',
      theme: AppTheme().themeData(),
      home: HomeScreen(),
    );
  }
}
