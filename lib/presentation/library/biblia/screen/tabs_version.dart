import 'package:flutter/material.dart';
import 'package:lumen/data/models/bible/bible_version.dart';
import 'package:lumen/data/repositories/bible_repository.dart';
import 'package:lumen/data/service/database_service.dart';
import 'package:lumen/presentation/library/biblia/widget/form_search.dart';

class TabsVersion extends StatelessWidget {
  const TabsVersion({super.key});

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
          child: Column(
            children: [
              /// Tabs
              TabBar(
                isScrollable: true,
                tabs: versions.map<Tab>((version) {
                  return Tab(text: version.name);
                }).toList(),
              ),

              /// Contenido de cada tab
              Expanded(
                child: TabBarView(
                  children: versions.map<Widget>((version) {
                    return FormSearch(version: version.id);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
