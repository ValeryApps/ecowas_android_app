import 'dart:async';

import 'package:ecowas24/models/website.dart';
import 'package:flutter/material.dart';
import 'package:ecowas24/widgets/navigation_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  static String routeName = "webview_screen";
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String _title = "Website name";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.green,
        elevation: 0.0,
        actions: [
          NavigationController(_controller.future),
        ],
      ),
      body: _buildWebView(),
      floatingActionButton: _showWebUrl(),
    );
  }

  Widget _buildWebView() {
    var id = ModalRoute.of(context).settings.arguments as String;
    var web = webs.firstWhere((element) => element.id == id);
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: web.domain,
      onWebViewCreated: (controller) {
        _controller.complete(controller);
      },
    );
  }

  Widget _showWebUrl() {
    return FutureBuilder(
      future: _controller.future,
      // initialData: InitialData,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        if (snapshot.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              String url = await snapshot.data.currentUrl();
              print(url);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("web url is: $url"),
              ));
            },
            child: Icon(Icons.link),
          );
        }
        return Container();
      },
    );
  }
}
