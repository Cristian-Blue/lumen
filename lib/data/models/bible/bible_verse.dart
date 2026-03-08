class BibleVerse {
  final int id;
  final String versionId;
  final int book;
  final String bookAbbrev;
  final int chapter;
  final int verse;
  final String text;

  BibleVerse({
    required this.id,
    required this.versionId,
    required this.book,
    required this.bookAbbrev,
    required this.chapter,
    required this.verse,
    required this.text,
  });

  factory BibleVerse.fromMap(Map<String, dynamic> json) {
    return BibleVerse(
      id: json['id'],
      versionId: json['version_id'],
      book: json['book'],
      bookAbbrev: json['book_abbrev'],
      chapter: json['chapter'],
      verse: json['verse'],
      text: json['text'],
    );
  }
}
