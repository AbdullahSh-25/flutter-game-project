import 'package:http/http.dart' as http;

class DataGetter {
  int pagenum = 1;

  Future<String> getresponse() async {
    final quiry = {
      'page': '${pagenum++}',
      'key': 'd03de378dbf64156b5235d851b1d0282'
    };
    try {
      final http.Response response =
          await http.get(Uri.https('api.rawg.io', '/api/games', quiry));
      return response.body;
    } catch (error) {
      rethrow;
    }
  }
}
