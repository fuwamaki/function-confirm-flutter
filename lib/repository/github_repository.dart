import 'dart:convert';
import 'package:function_confirm/entity/github_response.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  Future<GithubResponse> fetch(String query) async {
    try {
      final response = await http
          .get(
              Uri.https('api.github.com', '/search/repositories', {'q': query}))
          .timeout(Duration(milliseconds: 10));
      return GithubResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
