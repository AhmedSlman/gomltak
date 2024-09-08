import 'package:flutter/material.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InviteFriends extends StatefulWidget {
  final String url;

  const InviteFriends({super.key, required this.url});

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://gomltak.com/'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('gomltak'),
        centerTitle: true,
        backgroundColor: AppColors.kMaastrichtBlue,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
