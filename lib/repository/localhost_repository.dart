import 'package:http/http.dart' as http;

class LocalhostRepository {
  Future<String> fetch() async {
    try {
      // 10.0.2.2 にしないといけないらしい
      var url = Uri.http('10.0.2.2:4010', '/users');
      print(url);
      final response = await http.get(url);
      print(response.body);
      return response.body;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
