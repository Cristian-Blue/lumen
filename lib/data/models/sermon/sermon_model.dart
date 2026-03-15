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
    return SermonModel(
      json['id'],
      json['title'],
      json['author'],
      json['date'],
      json['tags'],
      json['description'],
    );
  }
}
