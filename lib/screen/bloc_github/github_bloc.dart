import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:function_confirm/entity/github_response.dart';
import 'package:function_confirm/repository/github_repository.dart';
import 'package:function_confirm/screen/bloc_github/github_event.dart';
import 'package:function_confirm/screen/bloc_github/github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  GithubBloc() : super(const GithubState()) {
    on<OnSubmitSearchRequest>(_onSubmitSearchRequest);
  }

  _onSubmitSearchRequest(
      OnSubmitSearchRequest event, Emitter<GithubState> emit) async {
    try {
      emit(state.copyWith(githubStatus: GithubStatus.fetching));
      GithubResponse response = await GithubRepository().fetch(event.inputText);
      emit(state.copyWith(
          githubStatus: GithubStatus.successFetch, githubResponse: response));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(githubStatus: GithubStatus.failureFetch));
    }
  }
}
