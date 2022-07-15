import 'package:flutter/material.dart';
import '../entity/github_response.dart';
import '../screen/webview/webview_page.dart';
// import '../entity/github_repo.dart';

Widget githubRepoList(GithubResponse? response) {
  return Expanded(
      child: Scrollbar(
          child: ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      final githubRepo = response!.items[index];
      return ListTile(
        leading: Container(
            padding: EdgeInsets.all(4.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  githubRepo.owner.avatarUrl,
                  width: 32,
                  height: 32,
                ))),
        title: Text(githubRepo.fullName),
        subtitle: Row(
          children: [
            const Icon(Icons.star_border),
            SizedBox(width: 4),
            Text(githubRepo.stargazersCount.toString())
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewPage(
                        urlString: githubRepo.htmlUrl,
                      )));
        },
      );
      // return _buildCard(githubRepo);
    },
    itemCount: response?.items.length ?? 0,
  )));
}

// Widget _buildCard(GithubRepo githubRepo) {
//   return Card(
//       margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
//       child: Row(
//         children: [
//           Container(
//               padding: EdgeInsets.all(4.0),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: Image.network(
//                     githubRepo.owner.avatarUrl,
//                     width: 32,
//                     height: 32,
//                   ))),
//           Padding(
//             padding: EdgeInsets.all(12.0),
//             child: Text(
//               githubRepo.fullName,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//             ),
//           ),
//         ],
//       ));
// }
