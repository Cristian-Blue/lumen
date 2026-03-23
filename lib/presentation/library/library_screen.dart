import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:lumen/presentation/library/biblia/screen/bibilia_screen.dart';
import 'package:lumen/presentation/library/preshow/preshow_screen.dart';
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
      child: ResizableContainer(
        direction: Axis.vertical,

        children: [
          ResizableChild(
            size: ResizableSize.ratio(0.2),
            child: PreshowScreen(),
          ),
          ResizableChild(
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
          ),
        ],
      ),
    );
  }
}
