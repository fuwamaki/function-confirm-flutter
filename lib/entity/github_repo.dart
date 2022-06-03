import 'package:function_confirm/entity/github_repo_owner.dart';

class GithubRepo {
  final String fullName;
  final int stargazersCount;
  final String htmlUrl;
  final GithubRepoOwner owner;

  GithubRepo(this.fullName, this.stargazersCount, this.htmlUrl, this.owner);

  GithubRepo.fromJson(Map<String, dynamic> json)
      : fullName = json['full_name'],
        stargazersCount = json['stargazers_count'],
        htmlUrl = json['html_url'],
        owner = GithubRepoOwner.fromJson(json['owner']);

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'stargazers_count': stargazersCount,
        'html_url': htmlUrl,
        'owner': owner.toJson()
      };
}
