import 'package:flutter/foundation.dart';
import './page.dart';

class Novel {
  final String? id;
  final String name;
  final String author;
  final String description;
  final String imageUrl;
  final List<Page> pages = [];
  final ValueNotifier<bool> _Inlibrary;

  Novel({
    this.id,
    required this.name,
    required this.author,
    required this.description,
    required this.imageUrl,
    isFavorite = false,
  }) : _Inlibrary = ValueNotifier(isFavorite);

  set isFavorite(bool newValuve){
    _Inlibrary.value = newValuve;
  }

  bool get isFavorite {
    return _Inlibrary.value;
  }

  ValueNotifier<bool> get isFavoriteListenable{
    return _Inlibrary;
  }
  Novel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Novel(
      id: id ?? this.id,
      name: name ?? this.name,
      author: author ?? this.author,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
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
      imageUrl: json['imageUrl'],
    );
  }
}
