import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String newsUrl;

  WebViewScreen(this.newsUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsUrl),
      ),
      body: WebView(
        initialUrl: newsUrl,
      ),
    );
  }
}
