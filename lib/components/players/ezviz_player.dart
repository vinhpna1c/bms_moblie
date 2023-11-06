import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EzvizPlayer extends StatefulWidget {
  final double aspectRatio;
  const EzvizPlayer({this.aspectRatio = 4 / 3, super.key});

  @override
  State<EzvizPlayer> createState() => _EzvizPlayerState();
}

class _EzvizPlayerState extends State<EzvizPlayer> {
  // ignore: non_constant_identifier_names
  final String EZVIZ_PLAYER_HOST =
      'https://vinhpna1c.github.io/ezviz-camera-live/';

  late final WebViewController _webViewController;
  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController(
      onPermissionRequest: (request) {
        print("Request from webview");
      },
    );
    _webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    _webViewController.setNavigationDelegate(NavigationDelegate());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print('Constraint: ${constraints.maxWidth}-${constraints.maxHeight}');
      // print(
      //     'URL: $EZVIZ_PLAYER_HOST?width=${constraints.maxWidth}&height=${constraints.maxWidth * 4 / 3}');
      _webViewController.loadRequest(Uri.parse(
          '$EZVIZ_PLAYER_HOST?width=${constraints.maxWidth}&height=${constraints.maxWidth / widget.aspectRatio}'));
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          SizedBox(
            height: constraints.maxWidth / 4 * 3,
            child: WebViewWidget(
              controller: _webViewController,
            ),
          ),
          SizedBox(),
        ],
      );
    });
  }
}
