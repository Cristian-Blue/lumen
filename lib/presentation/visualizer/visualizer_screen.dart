import 'package:flutter/material.dart';
import 'package:lumen/data/models/sermon/sermon_slide.dart';
import 'package:lumen/data/repositories/sermon/sermon_slide_respository.dart';
import 'package:lumen/data/service/database_service.dart';

class VisualizerScreen extends StatefulWidget {
  int sermonId;
  VisualizerScreen({super.key, required this.sermonId});

  @override
  State<VisualizerScreen> createState() => _VisualizerScreenState();
}

class _VisualizerScreenState extends State<VisualizerScreen> {
  late Future<List<SermonSlide>> sermonSlides;
  PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    sermonSlides = fetchSermonSlides();
  }

  Future<List<SermonSlide>> fetchSermonSlides() async {
    final db = await DatabaseService.instance.database;
    final repo = SermonSlideRespository(db);
    return repo.getSermonSlides(widget.sermonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: sermonSlides,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          }

          if (!asyncSnapshot.hasData) {
            return const Center(child: Text("No hay datos"));
          }
          final List<SermonSlide> presentation = asyncSnapshot.data ?? [];
          return PageView.builder(
            controller: _controller,
            itemCount: presentation.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    presentation[index].content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
