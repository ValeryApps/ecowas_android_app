import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationController extends StatelessWidget {
  final Future<WebViewController> controllerFuture;

  const NavigationController(this.controllerFuture, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controllerFuture,
      // initialData: InitialData,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: [
              TextButton(
                onPressed: () async {
                  if (await snapshot.data.canGoBack()) {
                    await snapshot.data.goBack();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "no history",
                      ),
                    ));
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                    ),
                    Text(
                      "Go Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () => snapshot.data.reload(),
              ),
              TextButton(
                onPressed: () async {
                  if (await snapshot.data.canGoForward()) {
                    await snapshot.data.goForward();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("no history"),
                    ));
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Go Forward",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
