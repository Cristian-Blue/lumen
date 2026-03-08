import 'package:flutter/material.dart';
import 'package:lumen/data/models/bible/bible_version.dart';
import 'package:lumen/data/repositories/bible_repository.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/library/biblia/screen/biblia_search_screen.dart';

class BibiliaScreen extends StatelessWidget {
  const BibiliaScreen({super.key});

  Future<List<BibleVersion>> getVersions() async {
    final db = await DatabaseService.instance.database;
    final repo = BibleRepository(db);
    return repo.getVersions();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVersions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("No hay datos"));
        }
        final List<BibleVersion> versions = snapshot.data ?? [];

        return DefaultTabController(
          length: versions.length,
          initialIndex: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: versions.map<Tab>((version) {
                  return Tab(text: version.name);
                }).toList(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(
                    children: versions.map<Widget>((version) {
                      return BibliaSearchScreen(version: version.id);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
