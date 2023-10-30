import 'package:flutter/foundation.dart';

class Novel {
  final String? id;
  final String name;
  final String author;
  final String description;
  final String imageUrl;
  final int countChapter;
  final ValueNotifier<bool> inlibrary;

  Novel({
    this.id,
    required this.name,
    required this.author,
    required this.description,
    required this.countChapter,
    required this.imageUrl,
    inlibrary = false,
  }) : inlibrary = ValueNotifier(inlibrary);

  set isFavorite(bool newValuve){
    inlibrary.value = newValuve;
  }

  bool get isInlibrary {
    return inlibrary.value;
  }

  ValueNotifier<bool> get isFavoriteListenable{
    return inlibrary;
  }
  Novel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
    bool? inlibrary,
  }) {
    return Novel(
      id: id ?? this.id,
      name: name,
      author: author,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      countChapter: countChapter,
      inlibrary: inlibrary ?? inlibrary, 
    );
  }

  Map<String, dynamic> toJson(){
    return {
        'name': name,
        'description': description,
        'author': author,
        'imageUrl': imageUrl,
    };
  }

  static Novel fromJson(Map<String, dynamic> json){
    return Novel       (
      id: json['id'],
      name: json['title'],
      description: json['description'],
      author: json['author'],
      inlibrary: json['inlibrary'], 
      countChapter: json['countChapter'],
      imageUrl: json['imageUrl'],
    );
  }
}
