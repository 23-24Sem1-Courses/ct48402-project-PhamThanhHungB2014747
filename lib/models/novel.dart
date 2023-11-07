import 'package:flutter/foundation.dart';

class Novel {
  final String? id;
  final String name;
  final String author;
  final String description;
  final String imageUrl;
  final int countChapter;
  final ValueNotifier<bool> _inlibrary;

  Novel({
    this.id,
    required this.name,
    required this.author,
    required this.description,
    required this.countChapter,
    required this.imageUrl,
    inlibrary = false,
  }) : _inlibrary = ValueNotifier(inlibrary);

  set isFavorite(bool newValuve) {
    _inlibrary.value = newValuve;
  }

  bool get isInlibrary {
    return _inlibrary.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _inlibrary;
  }

  Novel copyWith({
    String? id,
    String? name,
    String? author,
    String? description,
    int? counterChapter,
    String? imageUrl,
    bool? inlibrary,
  }) {
    return Novel(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      countChapter: countChapter,
      inlibrary: inlibrary ?? inlibrary,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'author': author,
      'description': description,
      // 'countChapter' countChapter,
      'imageUrl': imageUrl,
    };
  }

  static Novel fromJson(Map<String, dynamic> json) {
    return Novel(
      id: json['id'],
      name: json['title'],
      author: json['author'],
      description: json['description'],
      countChapter: json['countChapter'],
      imageUrl: json['imageUrl'],
      inlibrary: json['inlibrary'],
    );
  }
}
