import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
        initialUrl: "http://e.weather.com.cn/",
        onLoadStop: (InAppWebViewController controller, String url) {
          Future<String> str = rootBundle.loadString('assets/main.js');
          str.then((s) {
            controller.injectScriptCode(s);
          });
        });
  }
}
