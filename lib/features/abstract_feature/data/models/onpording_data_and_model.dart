import 'package:gomltak/core/utils/app_images.dart';
import 'package:gomltak/core/utils/app_string.dart';

class OnPordingInfo {
  final String title;
  final String image;
  final String body;
  OnPordingInfo({
    required this.title,
    required this.image,
    required this.body,
  });
}

List<OnPordingInfo> onpording = [
  OnPordingInfo(
    image: AppImages.man,
    title: AppString.onpordingTitle1,
    body: AppString.onpordingBody1,
  ),
  OnPordingInfo(
    image: AppImages.woman,
    title: AppString.onpordingTitle2,
    body: AppString.onpordingBody2,
  ),
];

List<String> getStartedImage = [
  AppImages.man,
  AppImages.woman,
  AppImages.man,
  AppImages.woman,
];
