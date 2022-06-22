import 'package:flutter/material.dart';
import 'package:function_confirm/entity/github_response.dart';
import 'package:function_confirm/repository/github_repository.dart';
import '../entity/github_repo.dart';

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

  Widget _buildInput() {
    return Container(
        margin: EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Please enter a search repository name.',
              labelText: "search"),
          onChanged: (inputString) {
            if (inputString.length >= 5) {
              setState(() {
                _isLoading = true;
              });
              GithubRepository().fetch().then((response) {
                setState(() {
                  _isLoading = false;
                  _response = response;
                });
              });
            }
          },
        ));
  }

  Widget _buildRepositoryList() {
    return Scrollbar(
        child: ListView(
      restorationId: 'repository_list_view',
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        for (int index = 1; index < (_response?.items.length ?? 1); index++)
          ListTile(
            leading: ExcludeSemantics(
              child: CircleAvatar(child: Text('$index')),
            ),
            title: Text(_response!.items[index].owner.avatarUrl),
            onTap: () {
              print("tap $index");
              print(_response!.items[index].fullName);
            },
          ),
      ],
    ));
    // return ListView.builder(
    //   itemBuilder: (BuildContext context, int index) {
    //     final githubRepo = _response!.items[index];
    //     return _buildCard(githubRepo);
    //   },
    //   itemCount: _response?.items.length ?? 0,
    // );
  }

  Widget _buildCard(GithubRepo githubRepo) {
    return Card(
      child: Text(
        githubRepo.fullName,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );

    // return Card(
    //   margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Padding(
    //         padding: EdgeInsets.all(12.0),
    //         child: Text(
    //           githubRepo.fullName,
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
          title: Text("Github Repository一覧"),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [_buildInput(), _buildRepositoryList()],
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
