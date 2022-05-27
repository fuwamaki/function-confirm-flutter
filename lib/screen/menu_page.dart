import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Menu Page")),
        body: Column(
          children: [
            ListTile(
              title: Text("コンテキストメニュー付き"),
              trailing: PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                onSelected: (value) => showInSnackBar(context, value),
                itemBuilder: (context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: "項目1 value",
                    child: Text("項目1"),
                  ),
                  PopupMenuItem<String>(
                    enabled: false,
                    child: Text("項目2"),
                  ),
                  PopupMenuItem<String>(
                    value: "項目3 value",
                    child: Text("項目3"),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("セクション分割メニュー付き"),
              trailing: PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                onSelected: (value) => showInSnackBar(context, value),
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "Preview value",
                    child: ListTile(
                      leading: const Icon(Icons.visibility),
                      title: Text(
                        "Preview",
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "Share value",
                    child: ListTile(
                      leading: const Icon(Icons.person_add),
                      title: Text(
                        "Share",
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "GetLink value",
                    child: ListTile(
                      leading: const Icon(Icons.link),
                      title: Text(
                        "GetLink",
                      ),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: "Remove",
                    child: ListTile(
                      leading: const Icon(Icons.delete),
                      title: Text(
                        "Remove",
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
