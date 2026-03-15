class SermonSlide {
  int id;
  int sermonId;
  int position;
  String content;
  String type;

  SermonSlide(this.id, this.sermonId, this.position, this.content, this.type);

  factory SermonSlide.fromJson(Map<String, dynamic> json) {
    return SermonSlide(
      json['id'],
      json['sermon_id'],
      json['position'],
      json['content'],
      json['type'],
    );
  }
}
