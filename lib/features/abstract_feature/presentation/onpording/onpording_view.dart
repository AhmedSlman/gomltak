import 'package:flutter/material.dart';

import '../../data/models/onpording_data_and_model.dart';
import 'onpording_widgerts/active_bottun_and_smooth.dart';
import 'onpording_widgerts/background_image.dart';
import 'onpording_widgerts/shadow_onbording.dart';
import 'onpording_widgerts/stringes.dart';

class OnpordingView extends StatefulWidget {
  const OnpordingView({super.key});
  @override
  State<OnpordingView> createState() => _OnpordingViewState();
}

class _OnpordingViewState extends State<OnpordingView> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: onpording.length,
            itemBuilder: (context, index) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  backgroundImageInOnpording(
                    image: onpording[index].image,
                  ),
                  shadowInOnpoirding(),
                  stringesInOnpording(
                    index: index,
                    context: context,
                  ),
                ],
              );
            },
          ),
          activeBottonAndSmooth(
            context: context,
            pageController: pageController,
          )
        ],
      ),
    );
  }
}
