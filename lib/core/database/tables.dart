class Tables {
  static const createVersions = '''
  CREATE TABLE  IF NOT EXISTS bible_versions (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    language TEXT NOT NULL
  )
  ''';

  static const createVerses = '''
  CREATE TABLE  IF NOT EXISTS bible_verses (
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
  CREATE INDEX IF NOT EXISTS idx_bible_reference 
  ON bible_verses(version_id, book_abbrev, book, chapter, verse)
  ''';

  static const createSong = '''
    CREATE TABLE  IF NOT EXISTS songs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      author TEXT,
      album TEXT,
      year INTEGER,
      ccli TEXT,
      created_at TEXT
    )
  ''';

  static const createSongSlide = '''
  CREATE TABLE IF NOT EXISTS song_slides (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    song_id INTEGER NOT NULL,
    position INTEGER NOT NULL,
    content TEXT,
    type TEXT,
    FOREIGN KEY(song_id) REFERENCES songs(id)
  )
  ''';
  static const createSongSlidesIndex = '''
    CREATE INDEX IF NOT EXISTS idx_song_slides_song_id
    ON song_slides(song_id, position)
  ''';

  static const createSermons = '''
    CREATE TABLE IF NOT EXISTS sermons (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        author TEXT,
        tags TEXT,
        date TEXT
    )
  ''';

  static const createSermonSlide = '''
    CREATE TABLE IF NOT EXISTS sermon_slides (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      sermon_id INTEGER NOT NULL,
      position INTEGER NOT NULL,
      content TEXT,
      type TEXT,
      FOREIGN KEY(sermon_id) REFERENCES sermons(id) 
    )
  ''';

  static const createSermonSlidesIndex = '''
    CREATE INDEX IF NOT EXISTS idx_sermon_slides_sermon_id
    ON sermon_slides(sermon_id, position)
  ''';
}
