import 'package:flutter/material.dart';
import '../entity/github_response.dart';
import '../repository/github_repository.dart';
import '../uicomponent/github_repo_input.dart';
import '../uicomponent/github_repo_list.dart';

class GithubRepoListPage extends StatefulWidget {
  const GithubRepoListPage({Key? key}) : super(key: key);

  @override
  State<GithubRepoListPage> createState() => _State();
}

class _State extends State<GithubRepoListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  GithubResponse? _response;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
      reverseCurve: Curves.fastOutSlowIn,
    )..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        } else if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.stop();
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

  Widget _buildIndicators(BuildContext context, Widget? child) {
    return Column(
      children: [const CircularProgressIndicator()],
    );
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
            _isLoading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: AnimatedBuilder(
                        animation: _animation,
                        builder: _buildIndicators,
                      ))
                    ],
                  )
                : Container()
          ],
        ));
  }
}
