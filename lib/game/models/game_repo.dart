import '../models/api_gettre.dart';
import '../models/games.dart';
import 'dart:convert';

class RepoData {
  final DataGetter dataGetter;

  RepoData({
    required this.dataGetter,
  });

  Future<List<Results>> pageGetter() async {
    final String result = await dataGetter.getresponse();
    final gamesresult = GamePageDetail.fromJson(json.decode(result));
    final games = getGameinPage(gamesresult.results!);
    return games;
  }

  List<Results> getGameinPage(List<Results> results) {
    final semiResult = results;
    final gameResult = semiResult
        .map((elem) => Results(
            id: elem.id,
            backgroundImage: elem.backgroundImage,
            name: elem.name,
            rating: elem.rating,
            ratingTop: elem.ratingTop,
            released: elem.released,
            genres: elem.genres,
            platforms: elem.platforms,
            stores: elem.stores))
        .toList();
    return gameResult;
  }
}
