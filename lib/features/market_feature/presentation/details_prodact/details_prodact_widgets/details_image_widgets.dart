// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gomltak/core/utils/extentions.dart';
import 'package:photo_view/photo_view.dart';

// class DetaislImages extends StatefulWidget {
//   const DetaislImages({
//     super.key,
//   });
//   final Image images;

//   @override
//   State<DetaislImages> createState() => _DetaislImagesState();
// }

// class _DetaislImagesState extends State<DetaislImages> {
//   PageController pageController = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 315.h,
//       width: context.width,
//       child: Stack(
//         children: [
//           Positioned.fill(
//               child: PageView.builder(
//             controller: pageController,
//             scrollDirection: Axis.horizontal,
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return SizedBox(
//                 width: context.width,
//                 child: Image.asset(
//                   alignment: Alignment.topCenter,
//                   AppImages.man,
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//           )),
//           Positioned.fill(
//               bottom: 11.h,
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: SmoothPageIndicator(
//                   controller: pageController,
//                   count: 3,
//                   effect: ScrollingDotsEffect(
//                     activeDotColor: AppColors.kCeladonGreen,
//                     dotColor: AppColors.kRGPDDots,
//                     dotWidth: 10.w,
//                     dotHeight: 10.w,
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }

class DetaislImages extends StatelessWidget {
  const DetaislImages({
    super.key,
    required this.images,
  });
  final String images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showAdaptiveDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: PhotoView(
            tightMode: true,
            backgroundDecoration: const BoxDecoration(),
            imageProvider: CachedNetworkImageProvider(
                'https://gomltak.com/Backend/$images'),
            loadingBuilder: (context, event) =>
                const CircularProgressIndicator(),
          ),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        clipBehavior: Clip.hardEdge,
        height: 350.h,
        width: context.width,
        child: CachedNetworkImage(
          imageUrl: 'https://gomltak.com/Backend/$images',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
