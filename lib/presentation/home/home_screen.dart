import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:lumen/presentation/editor/editor_screen.dart';
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
            child: ResizableContainer(
              direction: Axis.horizontal,
              children: [
                ResizableChild(
                  size: ResizableSize.ratio(0.2),
                  child: LibraryScreen(),
                ),
                ResizableChild(
                  size: ResizableSize.ratio(0.6),
                  child: EditorScreen(),
                ),

                ResizableChild(
                  size: ResizableSize.ratio(0.2),
                  child: ColoredBox(
                    color: Colors.green,
                    child: Center(child: Text("Preview")),
                  ),
                ),
              ],
            ),
          ),
          Text('Button'),
        ],
      ),
    );
  }
}
