class JLPT {
  const JLPT({
    required this.id,
    required this.level,
  });
  final int id;
  final String level;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'level': level,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'JLPT $level';
  }
}

class Unit {
  const Unit({
    required this.id,
    required this.no,
    required this.level
  });
  final int id;
  final int no;
  final int level;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'no':no,
      'level': level,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '$level unit: $no';
  }
}

class QuestionSet {
  const QuestionSet({
    required this.id,
    required this.no,
    required this.isCompleted,
    required this.unit,
  });
  final int id;
  final int no;
  final int isCompleted;
  final int unit;

  Map<String, dynamic> toMap() {
    return {
      'chapterId': id,
      'no':no,
      'unit': unit,
      'is_completed': isCompleted
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '$unit set: $no';
  }
}

class Vocab {
  const Vocab({
    required this.id,
    required this.set,
    required this.word,
    required this.pronunciation,
    required this.meaning,
  });

  final int id;
  final int set;
  final String word;
  final String pronunciation;
  final String meaning;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'set': set,
      'word': word,
      'pronunciation': pronunciation,
      'meaning': meaning,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '$set {pronunciation: $pronunciation, word: $word, meaning: $meaning';
  }
}

class Kanji {
  const Kanji({
    required this.id,
    required this.kanji,
    required this.onyomi,
    required this.kunyomi,
    required this.meaning,
  });

  final int id;
  final String kanji;
  final String onyomi;
  final String kunyomi;
  final String meaning;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kanji': kanji,
      'onyomi': onyomi,
      'kunyomi': kunyomi,
      'meaning': meaning,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '$kanji {onyomi: $onyomi, kunyomi: $kunyomi, meaning: $meaning';
  }
}
