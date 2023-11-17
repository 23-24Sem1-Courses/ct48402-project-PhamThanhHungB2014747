import 'dart:convert';
// import 'dart:html';
import 'package:ct484_project/models/chapter.dart';
import 'package:http/http.dart' as http;
// import '../models/chapter.dart';
import '../models/auth_token.dart';
import 'firebase_service.dart';

class ChaptersService extends FirebaseService {
  ChaptersService([AuthToken? authToken]) : super(authToken);

  fetchChapters(String novelId) async {
    final chapters = Chapter(chapterCount: 0, chapterContent: []);
    try {
      final userLibrarysUrl =
          Uri.parse('$databaseUrl/chapter/$novelId.json?auth=$token');
      final userLibrarysResponse = await http.get(userLibrarysUrl);
      final userLibrarysMap = json.decode(userLibrarysResponse.body);
      // print(novelId);
      // print(userLibrarysMap.runtimeType);
      userLibrarysMap.forEach((key, chapter) {
        if (chapter != null) {
          chapter.forEach((item) {
            // print(item);
            chapters.addChapterContent(jsonEncode(item));
          });
        }
      });
      // print(chapters.chapterCount);
      print('2');
      return chapters;
    } catch (error) {
      print(error);
      return chapters;
    }
  }
}
