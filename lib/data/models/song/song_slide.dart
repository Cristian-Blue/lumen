class SongSlide {
  final int id;
  final int songId;
  final int position;
  final String content;
  final String type;

  SongSlide({
    required this.id,
    required this.songId,
    required this.position,
    required this.content,
    required this.type,
  });

  factory SongSlide.fromMap(Map<String, dynamic> map) {
    return SongSlide(
      id: map['id'] ?? 0,
      songId: map['song_id'] ?? 0,
      position: map['position'] ?? 0,
      content: map['content'] ?? '',
      type: map['type'] ?? '',
    );
  }
}
