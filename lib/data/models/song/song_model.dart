class SongModel {
  final int id;
  final String title;
  final String? author;

  SongModel({required this.id, required this.title, this.author});

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
    );
  }
}
