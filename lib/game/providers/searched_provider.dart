import 'dart:convert';

import 'package:bloc_test_one/game/models/games.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SearchGames with ChangeNotifier {
  List<Results> _items = [];

  List<Results> get items {
    return [..._items];
  }

  Future<void> search(String val) async {
    final String result = await getsearchresponse(val);
    final gamesresult = GamePageDetail.fromJson(json.decode(result));
    final games = getGameinPage(gamesresult.results!);
    _items = games;
    notifyListeners();
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

  Future<String> getsearchresponse(String val) async {
    final quiry = {'key': 'd03de378dbf64156b5235d851b1d0282', 'search': val};
    try {
      final http.Response response =
          await http.get(Uri.https('api.rawg.io', '/api/games', quiry));

      return response.body;
    } catch (error) {
      rethrow;
    }
  }
}
