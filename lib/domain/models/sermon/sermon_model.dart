class SermonModel {
  final String id;
  final String title;
  final String preacher;
  final DateTime date;
  final String description;
  final List<String> slides;
  final List<String> tags;

  SermonModel({
    required this.id,
    required this.title,
    required this.preacher,
    required this.date,
    required this.description,
    required this.slides,
    required this.tags,
  });
}
