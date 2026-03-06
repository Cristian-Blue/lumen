class Tables {
  static const createVersions = '''
  CREATE TABLE bible_versions (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    language TEXT NOT NULL
  )
  ''';

  static const createVerses = '''
  CREATE TABLE bible_verses (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      version_id TEXT,
      book INTEGER,
      book_abbrev TEXT,
      chapter INTEGER,
      verse INTEGER,
      text TEXT,
    FOREIGN KEY (version_id) REFERENCES bible_versions(id)
  )
  ''';

  static const createIndexReference = '''
  CREATE INDEX idx_bible_reference 
  ON bible_verses(version_id, book_abbrev, book, chapter, verse)
  ''';
}
