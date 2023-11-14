import 'package:flutter/foundation.dart';

class Page {
  final String? title;
  final String content;
  final int NunberPage;
  final ValueNotifier<bool> _readed;
  Page({
    this.title,
    required this.content,
    required this.NunberPage,
    readed = false,
  }) : _readed = ValueNotifier(readed);

  set isreaded(bool newValuve){
    _readed.value = newValuve;
  }

  bool get isFavorite {
    return _readed.value;
  }

  ValueNotifier<bool> get isFavoriteListenable{
    return _readed;
  }
  Page copyWith({
    String? title,
    String? content,
    int? NunberPage,
    bool? readed,
  }) {
    return Page(
      title: title ?? this.title,
      content: content ?? this.content,
      NunberPage: NunberPage ?? this.NunberPage,
      readed: readed ?? this._readed,
    );
  }

  Map<String, dynamic> toJson(){
    return {
        'title': title,
        'content': content,
        'NunberPage': NunberPage,
    };
  }

  static Page fromJson(Map<String, dynamic> json){
    return Page(
      title: json['title'],
      content: json['content'],
      NunberPage: json['NunberPage'],
    );
  }
}
