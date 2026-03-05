class BibleVersion {
  final String id;
  final String name;
  final String language;

  BibleVersion({required this.id, required this.name, required this.language});

  factory BibleVersion.fromMap(Map<String, dynamic> json) {
    return BibleVersion(
      id: json['id'],
      name: json['name'],
      language: json['language'],
    );
  }
}
