final String tableBooks = 'books';

class BookFields {
  static final ListString values = [
    /// Add all fields
    id, number, title, description, time
  ];

  static final String id = '_id';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Book {
  final int? id;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Book({
    this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Book copy({
    int? id,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Book(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Book fromJson(Map<String, Object?> json) => Book(
        id: json[BookFields.id] as int?,
        number: json[BookFields.number] as int,
        title: json[BookFields.title] as String,
        description: json[BookFields.description] as String,
        createdTime: DateTime.parse(json[BookFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        BookFields.id: id,
        BookFields.title: title,
        BookFields.number: number,
        BookFields.description: description,
        BookFields.time: createdTime.toIso8601String(),
      };
}
