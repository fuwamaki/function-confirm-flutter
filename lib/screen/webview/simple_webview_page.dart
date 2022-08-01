import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleWebViewPage extends StatelessWidget {
  const SimpleWebViewPage({Key? key, required this.urlString})
      : super(key: key);
  final String urlString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("WebView")),
        body: WebView(
          initialUrl: urlString,
        ));
  }
}
