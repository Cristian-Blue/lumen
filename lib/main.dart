import 'package:flutter/material.dart';
import 'package:lumen/core/theme/theme.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.instance.database;
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
