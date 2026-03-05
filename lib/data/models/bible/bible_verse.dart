class BibleVerse {
  final int bookId;
  final int chapter;
  final int verse;
  final String text;

  BibleVerse({
    required this.bookId,
    required this.chapter,
    required this.verse,
    required this.text,
  });

  factory BibleVerse.fromMap(Map<String, dynamic> json) {
    return BibleVerse(
      bookId: json['book_id'],
      chapter: json['chapter'],
      verse: json['verse'],
      text: json['text'],
    );
  }
}
