class GithubRepoOwner {
  final String avatarUrl;

  GithubRepoOwner(this.avatarUrl);

  GithubRepoOwner.fromJson(Map<String, dynamic> json)
      : avatarUrl = json['avatar_url'];

  Map<String, dynamic> toJson() => {'avatar_url': avatarUrl};
}
