import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_basic_pp/Style/FontStyle.dart';

void showWebviewDialog(BuildContext context, String title, String url) {
  Completer<WebViewController> controller = Completer<WebViewController>();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: HeaderStyle(),
              ),
              AspectRatio(
                aspectRatio: 1.0,
                child: WebView(
                  onWebViewCreated: (WebViewController webCtrl) {
                    controller.complete(webCtrl);
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: url,
                ),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context), child: Text("Close"))
            ],
          ),
        );
      });
}
