import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;

  WebViewContainer(this.url);

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.url,
        ),
      ),
    );
  }
}
