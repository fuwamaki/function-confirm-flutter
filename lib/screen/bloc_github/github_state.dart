import 'package:equatable/equatable.dart';
import 'package:function_confirm/entity/github_response.dart';

enum GithubStatus {
  idle,
  fetching,
  successFetch,
  failureFetch,
}

class GithubState extends Equatable {
  final String title;

  final GithubStatus githubStatus;
  final GithubResponse? githubResponse;

  bool get isRequesting => githubStatus == GithubStatus.fetching;
  bool get isSuccessLogin => githubStatus == GithubStatus.successFetch;
  bool get isFailedLogin => githubStatus == GithubStatus.failureFetch;

  const GithubState(
      {this.title = '',
      this.githubStatus = GithubStatus.idle,
      this.githubResponse});

  GithubState copyWith(
      {String? title,
      GithubStatus? githubStatus,
      GithubResponse? githubResponse}) {
    return GithubState(
        title: title ?? this.title,
        githubStatus: githubStatus ?? GithubStatus.idle,
        githubResponse: githubResponse);
  }

  @override
  List<Object?> get props => [title, githubStatus, githubResponse];
}
