import 'package:flutter/material.dart';
import 'package:lumen/presentation/library/library_screen.dart';
import 'package:lumen/presentation/shared/layout/topbar/tobar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarWidget(),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 2, child: LibraryScreen()),
                Expanded(flex: 5, child: Text('previow')),
                Expanded(flex: 3, child: Text('Slide')),
              ],
            ),
          ),
          Text('Button'),
        ],
      ),
    );
  }
}
