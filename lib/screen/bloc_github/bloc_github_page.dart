import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:function_confirm/screen/bloc_github/github_bloc.dart';
import 'package:function_confirm/screen/bloc_github/github_event.dart';
import 'package:function_confirm/screen/bloc_github/github_state.dart';
import 'package:function_confirm/uicomponent/github_repo_input.dart';
import 'package:function_confirm/uicomponent/github_repo_list.dart';
import 'package:function_confirm/uicomponent/loading_view.dart';

class BlocGithubPage extends StatelessWidget {
  BlocGithubPage({
    Key? key,
  }) : super(key: key);

  final _bloc = GithubBloc();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GithubBloc, GithubState>(
      listener: (context, state) {
        // リスナー
      },
      bloc: _bloc,
      child: BlocBuilder<GithubBloc, GithubState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("リスト"),
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      githubRepoInput(
                        (text) {
                          _bloc.add(OnSubmitSearchRequest(inputText: text));
                        },
                      ),
                      githubRepoList(_bloc.state.githubResponse)
                    ],
                  ),
                  _bloc.state.isRequesting ? LoadingView() : Container()
                ],
              ));
        },
        bloc: _bloc,
      ),
    );
  }
}
