import 'dart:convert';
import 'package:function_confirm/entity/github_response.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  Future<GithubResponse> fetch() async {
    try {
      // final response = await http.get(Uri.https(
      //     'https://api.github.com', '/search/repositories', {'q': 'dart'}));
      var url = Uri.parse('https://api.github.com/search/repositories?q=dart');
      final response = await http.get(url);
      print(response.body);
      print(response.statusCode);
      var test = GithubResponse.fromJson(jsonDecode(response.body));
      print(test.items.first.fullName);
      return GithubResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
