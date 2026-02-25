import 'package:flutter/material.dart';

@immutable
class Tafsir {
  final int? id;
  final String? name;
  final String? language;
  final String? author;
  final String? bookName;

  const Tafsir({this.id, this.name, this.language, this.author, this.bookName});

  @override
  String toString() {
    return 'TafsirListResponse(id: $id, name: $name, language: $language, author: $author, bookName: $bookName)';
  }

  factory Tafsir.fromJson(Map<String, dynamic> json) {
    return Tafsir(
      id: json['id'] as int?,
      name: json['name'] as String?,
      language: json['language'] as String?,
      author: json['author'] as String?,
      bookName: json['book_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'language': language,
    'author': author,
    'book_name': bookName,
  };

  Tafsir copyWith({
    int? id,
    String? name,
    String? language,
    String? author,
    String? bookName,
  }) {
    return Tafsir(
      id: id ?? this.id,
      name: name ?? this.name,
      language: language ?? this.language,
      author: author ?? this.author,
      bookName: bookName ?? this.bookName,
    );
  }
}
