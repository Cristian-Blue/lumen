import 'package:flutter/material.dart';
import 'package:lumen/presentation/library/biblia/screen/bibilia_screen.dart';
import 'package:lumen/presentation/library/sermon/screens/predicacion_screen.dart';
import 'package:lumen/presentation/library/song/screens/song_screen.dart';
import 'package:lumen/presentation/library/layout/header_widget.dart';
import 'package:lumen/presentation/library/widget/tabs_widget.dart';

const List<Widget> pages = <Widget>[
  SongScreen(),
  BibiliaScreen(),
  PredicacionScreen(),
];

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(Colors.blue.value),
      child: Column(
        children: [
          HeaderWidget(),
          TabsWidget(
            selectedIndex: _selectedIndex,
            onTabSelected: onTabSelected,
          ),
          Expanded(child: pages[_selectedIndex]),
        ],
      ),
    );
  }
}
