import 'package:flutter/material.dart';
import '../entity/github_response.dart';
import '../repository/github_repository.dart';
import '../uicomponent/github_repo_input.dart';
import '../uicomponent/github_repo_list.dart';
import '../uicomponent/loading_view.dart';

class GithubRepoListPage extends StatefulWidget {
  const GithubRepoListPage({Key? key}) : super(key: key);

  @override
  State<GithubRepoListPage> createState() => _State();
}

class _State extends State<GithubRepoListPage>
    with SingleTickerProviderStateMixin {
  GithubResponse? _response;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void load(String text) {
    setState(() {
      _isLoading = true;
    });
    GithubRepository().fetch(text).then((response) {
      setState(() {
        _isLoading = false;
        _response = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("リスト"),
        ),
        body: Stack(
          children: [
            Expanded(
                child: Column(
              children: [
                githubRepoInput(
                  (text) {
                    load(text);
                  },
                ),
                githubRepoList(_response)
              ],
            )),
            _isLoading ? LoadingView() : Container()
          ],
        ));
  }
}
