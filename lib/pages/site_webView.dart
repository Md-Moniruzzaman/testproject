// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SiteInWebView extends StatefulWidget {
  const SiteInWebView({Key? key}) : super(key: key);

  @override
  State<SiteInWebView> createState() => _SiteInWebViewState();
}

class _SiteInWebViewState extends State<SiteInWebView> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://flutter.dev',
    );
  }
}
