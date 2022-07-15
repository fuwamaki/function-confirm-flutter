import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.urlString}) : super(key: key);
  final String urlString;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _controller = Completer<WebViewController>();

  bool _isLoading = false;
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          if (_isLoading) const LinearProgressIndicator(),
          Expanded(
            child: WebView(
              initialUrl: widget.urlString,
              javascriptMode: JavascriptMode.unrestricted, // jsを有効化
              onWebViewCreated: _controller.complete, // controllerを登録
              onPageStarted: (String url) {
                setState(() {
                  _isLoading = true;
                });
              },
              onPageFinished: (String url) async {
                setState(() {
                  _isLoading = false;
                });
                final controller = await _controller.future;
                final title = await controller.getTitle();
                setState(() {
                  if (title != null) {
                    _title = title;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
