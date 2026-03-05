class BibleChapter {
  final int id;
  final int bookId;
  final int chapterNumber;

  BibleChapter({
    required this.id,
    required this.bookId,
    required this.chapterNumber,
  });

  factory BibleChapter.fromMap(Map<String, dynamic> json) {
    return BibleChapter(
      id: json['id'],
      bookId: json['book_id'],
      chapterNumber: json['chapter_number'],
    );
  }
}
