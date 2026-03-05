class BibleBook {
  final int id;
  final String versionId;
  final String name;
  final int position;
  final String testament;

  BibleBook({
    required this.id,
    required this.versionId,
    required this.name,
    required this.position,
    required this.testament,
  });

  factory BibleBook.fromMap(Map<String, dynamic> json) {
    return BibleBook(
      id: json['id'],
      versionId: json['version_id'],
      name: json['name'],
      position: json['position'],
      testament: json['testament'],
    );
  }
}
