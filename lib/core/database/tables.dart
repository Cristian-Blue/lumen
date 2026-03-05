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
    version_id TEXT NOT NULL,
    book INTEGER NOT NULL,
    chapter INTEGER NOT NULL,
    verse INTEGER NOT NULL,
    text TEXT NOT NULL,
    FOREIGN KEY (version_id) REFERENCES bible_versions(id)
  )
  ''';

  static const createIndexReference = '''
  CREATE INDEX idx_bible_reference 
  ON bible_verses(version_id, book, chapter, verse)
  ''';
}
