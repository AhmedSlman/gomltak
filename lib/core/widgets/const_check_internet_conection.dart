import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CheckInternetConection extends StatelessWidget {
  const CheckInternetConection({
    Key? key,
    required this.isInternetConection,
    required this.notInternetConection,
  }) : super(key: key);
  final Widget isInternetConection;
  final Widget notInternetConection;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return isInternetConection;
        } else {
          return notInternetConection;
        }
      },
      child: Container(),
    );
  }
}
