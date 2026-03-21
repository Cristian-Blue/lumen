class SermonModel {
  final int id;
  final String title;
  final String author;
  final String date;
  final List<String> tags;
  final String description;

  SermonModel(
    this.id,
    this.title,
    this.author,
    this.date,
    this.tags,
    this.description,
  );

  factory SermonModel.fromJson(Map<String, dynamic> json) {
    // 🔥 Manejo seguro de tags
    List<String> parsedTags = [];

    if (json['tags'] is String) {
      parsedTags = (json['tags'] as String)
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    } else if (json['tags'] is List) {
      parsedTags = List<String>.from(json['tags']);
    }

    return SermonModel(
      json['id'] ?? 0,
      json['title'] ?? '',
      json['author'] ?? '',
      json['date'] ?? '',
      parsedTags,
      json['description'] ?? '',
    );
  }
}
