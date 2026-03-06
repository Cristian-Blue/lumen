class BibleBook {
  String name;
  String abbrev;

  BibleBook({required this.name, required this.abbrev});

  factory BibleBook.fromJson(Map<String, dynamic> json) {
    return BibleBook(name: json['name'], abbrev: json['abbrev']);
  }
}
