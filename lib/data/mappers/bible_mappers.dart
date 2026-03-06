const Map<String, String> bibleBookMap = {
  // Pentateuco
  "gn": "Génesis",
  "gen": "Génesis",
  "genesis": "Génesis",
  "génesis": "Génesis",

  "ex": "Éxodo",
  "exo": "Éxodo",
  "exodus": "Éxodo",
  "éxodo": "Éxodo",

  "lv": "Levítico",
  "lev": "Levítico",
  "levitico": "Levítico",
  "levítico": "Levítico",
  "leviticus": "Levítico",

  "nm": "Números",
  "num": "Números",
  "numeros": "Números",
  "números": "Números",
  "numbers": "Números",

  "dt": "Deuteronomio",
  "deut": "Deuteronomio",
  "deuteronomio": "Deuteronomio",
  "deuteronomy": "Deuteronomio",

  // Históricos
  "js": "Josué",
  "josue": "Josué",
  "josué": "Josué",
  "joshua": "Josué",

  "jud": "Jueces",
  "jue": "Jueces",
  "jueces": "Jueces",
  "judges": "Jueces",

  "rt": "Rut",
  "rut": "Rut",
  "ruth": "Rut",

  "1sm": "1 Samuel",
  "1sam": "1 Samuel",
  "1samuel": "1 Samuel",
  "1 samuel": "1 Samuel",

  "2sm": "2 Samuel",
  "2sam": "2 Samuel",
  "2samuel": "2 Samuel",
  "2 samuel": "2 Samuel",

  "1kgs": "1 Reyes",
  "1re": "1 Reyes",
  "1reyes": "1 Reyes",
  "1kings": "1 Reyes",

  "2kgs": "2 Reyes",
  "2re": "2 Reyes",
  "2reyes": "2 Reyes",
  "2kings": "2 Reyes",

  "1ch": "1 Crónicas",
  "1cronicas": "1 Crónicas",
  "1crónicas": "1 Crónicas",
  "1chronicles": "1 Crónicas",

  "2ch": "2 Crónicas",
  "2cronicas": "2 Crónicas",
  "2crónicas": "2 Crónicas",
  "2chronicles": "2 Crónicas",

  "ezr": "Esdras",
  "esd": "Esdras",
  "esdras": "Esdras",
  "ezra": "Esdras",

  "ne": "Nehemías",
  "neh": "Nehemías",
  "nehemias": "Nehemías",
  "nehemías": "Nehemías",
  "nehemiah": "Nehemías",

  "et": "Ester",
  "est": "Ester",
  "ester": "Ester",
  "esther": "Ester",

  // Poéticos
  "job": "Job",

  "ps": "Salmos",
  "sal": "Salmos",
  "salmos": "Salmos",
  "psalms": "Salmos",

  "prv": "Proverbios",
  "prov": "Proverbios",
  "proverbios": "Proverbios",
  "proverbs": "Proverbios",

  "ec": "Eclesiastés",
  "eclesiastes": "Eclesiastés",
  "eclesiastés": "Eclesiastés",
  "ecclesiastes": "Eclesiastés",

  "so": "Cantares",
  "cnt": "Cantares",
  "cantares": "Cantares",
  "song": "Cantares",

  // Profetas mayores
  "is": "Isaías",
  "isa": "Isaías",
  "isaias": "Isaías",
  "isaías": "Isaías",
  "isaiah": "Isaías",

  "jr": "Jeremías",
  "jer": "Jeremías",
  "jeremias": "Jeremías",
  "jeremías": "Jeremías",
  "jeremiah": "Jeremías",

  "lm": "Lamentaciones",
  "lam": "Lamentaciones",
  "lamentaciones": "Lamentaciones",
  "lamentations": "Lamentaciones",

  "ez": "Ezequiel",
  "eze": "Ezequiel",
  "ezequiel": "Ezequiel",
  "ezekiel": "Ezequiel",

  "dn": "Daniel",
  "dan": "Daniel",
  "daniel": "Daniel",

  // Profetas menores
  "ho": "Oseas",
  "ose": "Oseas",
  "oseas": "Oseas",
  "hosea": "Oseas",

  "jl": "Joel",
  "joel": "Joel",

  "am": "Amós",
  "amos": "Amós",

  "ob": "Abdías",
  "abd": "Abdías",
  "abdias": "Abdías",
  "abdías": "Abdías",
  "obadiah": "Abdías",

  "jn": "Jonás",
  "jon": "Jonás",
  "jonas": "Jonás",
  "jonás": "Jonás",
  "jonah": "Jonás",

  "mi": "Miqueas",
  "mic": "Miqueas",
  "miqueas": "Miqueas",
  "micah": "Miqueas",

  "na": "Nahúm",
  "nah": "Nahúm",
  "nahum": "Nahúm",

  "hk": "Habacuc",
  "hab": "Habacuc",
  "habacuc": "Habacuc",
  "habakkuk": "Habacuc",

  "zp": "Sofonías",
  "sof": "Sofonías",
  "sofonias": "Sofonías",
  "sofonías": "Sofonías",
  "zephaniah": "Sofonías",

  "hg": "Hageo",
  "hageo": "Hageo",
  "haggai": "Hageo",

  "zc": "Zacarías",
  "zac": "Zacarías",
  "zacarias": "Zacarías",
  "zacarías": "Zacarías",
  "zechariah": "Zacarías",

  "ml": "Malaquías",
  "mal": "Malaquías",
  "malaquias": "Malaquías",
  "malaquías": "Malaquías",
  "malachi": "Malaquías",

  // Evangelios
  "mt": "Mateo",
  "mat": "Mateo",
  "mateo": "Mateo",
  "matthew": "Mateo",

  "mk": "Marcos",
  "mar": "Marcos",
  "marcos": "Marcos",
  "mark": "Marcos",

  "lk": "Lucas",
  "luc": "Lucas",
  "lucas": "Lucas",
  "luke": "Lucas",

  "jo": "Juan",
  "juan": "Juan",
  "john": "Juan",

  // Hechos
  "act": "Hechos",
  "hch": "Hechos",
  "hechos": "Hechos",
  "acts": "Hechos",

  // Cartas
  "rm": "Romanos",
  "rom": "Romanos",
  "romanos": "Romanos",
  "romans": "Romanos",

  "1co": "1 Corintios",
  "1cor": "1 Corintios",
  "1corintios": "1 Corintios",

  "2co": "2 Corintios",
  "2cor": "2 Corintios",
  "2corintios": "2 Corintios",

  "gl": "Gálatas",
  "gal": "Gálatas",
  "galatas": "Gálatas",
  "gálatas": "Gálatas",

  "eph": "Efesios",
  "ef": "Efesios",
  "efesios": "Efesios",

  "ph": "Filipenses",
  "fil": "Filipenses",
  "filipenses": "Filipenses",

  "cl": "Colosenses",
  "col": "Colosenses",
  "colosenses": "Colosenses",

  "1ts": "1 Tesalonicenses",
  "1tes": "1 Tesalonicenses",
  "1tesalonicenses": "1 Tesalonicenses",

  "2ts": "2 Tesalonicenses",
  "2tes": "2 Tesalonicenses",
  "2tesalonicenses": "2 Tesalonicenses",

  "1tm": "1 Timoteo",
  "1tim": "1 Timoteo",
  "1timoteo": "1 Timoteo",

  "2tm": "2 Timoteo",
  "2tim": "2 Timoteo",
  "2timoteo": "2 Timoteo",

  "tt": "Tito",
  "tit": "Tito",
  "tito": "Tito",

  "phm": "Filemón",
  "filemon": "Filemón",
  "filemón": "Filemón",

  "hb": "Hebreos",
  "heb": "Hebreos",
  "hebreos": "Hebreos",

  "jm": "Santiago",
  "stg": "Santiago",
  "santiago": "Santiago",

  "1pe": "1 Pedro",
  "1pedro": "1 Pedro",

  "2pe": "2 Pedro",
  "2pedro": "2 Pedro",

  "1jo": "1 Juan",
  "1juan": "1 Juan",

  "2jo": "2 Juan",
  "2juan": "2 Juan",

  "3jo": "3 Juan",
  "3juan": "3 Juan",

  "jd": "Judas",
  "judas": "Judas",

  "re": "Apocalipsis",
  "ap": "Apocalipsis",
  "apocalipsis": "Apocalipsis",
  "revelation": "Apocalipsis",
};
