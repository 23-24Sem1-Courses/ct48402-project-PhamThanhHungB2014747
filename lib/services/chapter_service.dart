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
      // print(userLibrarysMap[3]);
      userLibrarysMap.forEach((chapter) {
        if (chapter != null) {
          chapters.addChapterContent(jsonEncode(chapter));
        }
      });

      // print(chapters.chapterCount);
      return chapters;
    } catch (error) {
      print(error);
      return chapters;
    }
  }
}
