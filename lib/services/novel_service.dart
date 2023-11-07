import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/novel.dart';
import '../models/auth_token.dart';
import 'firebase_service.dart';

class NovelsService extends FirebaseService {
  NovelsService([AuthToken? authToken]) : super(authToken);

  Future<List<Novel>> fetchNovels([bool filterByUser = false]) async {
    final List<Novel> novels = [];

    try {
      final filters =
          filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
      final novelUrl =
          Uri.parse('$databaseUrl/novels.json?auth=$token&$filters');
      final response = await http.get(novelUrl);
      final novelSMap = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        print(novelSMap['error']);
        return novels;
      }

      final userFavoritesUrl =
          Uri.parse('$databaseUrl/userFavorites/$userId.json?auth=$token');
      final userFavoritesResponse = await http.get(userFavoritesUrl);
      final userFavoritesMap = json.decode(userFavoritesResponse.body);

      novelSMap.forEach((novelId, novel) {
        final inLibrary = (userFavoritesMap == null)
            ? false
            : (userFavoritesMap[novelId] ?? false);

        novels.add(
          Novel.fromJson({
            'id': novelId,
            ...novel,
          }).copyWith(inlibrary: inLibrary),
        );
      });
      return novels;
    } catch (error) {
      print(error);
      return novels;
    }
  }

  Future<Novel?> addNovel(Novel novel) async {
    try {
      // ignore: non_constant_identifier_names
      final Url = Uri.parse('$databaseUrl/novels.json?auth=$token');
      final response = await http.post(
        Url,
        body: json.encode(
          novel.toJson()
            ..addAll({
              'creatorId': userId,
            }),
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return novel.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> updateNovel(Novel novel) async {
    try {
      final url = Uri.parse('$databaseUrl/novels/${novel.id}.json?auth=$token');
      final response = await http.patch(
        url,
        body: json.encode(novel.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> deleteNovel(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/novels/$id.json?auth=$token');
      final response = await http.delete(url);

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  // Future<bool> saveFavoriteStatus(Product product) async {
  //   try {
  //     final url = Uri.parse(
  //         '$databaseUrl/userFavorites/$userId/${product.id}.json?auth=$token');
  //     final response = await http.put(
  //       url,
  //       body: json.encode(
  //         product.isFavorite,
  //       ),
  //     );

  //     if (response.statusCode != 200) {
  //       throw Exception(json.decode(response.body)['error']);
  //     }

  //     return true;
  //   } catch (error) {
  //     print(error);
  //     return false;
  //   }
  // }
}
