// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';

// ignore: must_be_immutable
class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.itemCount,
    this.onTapMinus,
    this.onTapPlus,
  });
  final int itemCount;
  final Function()? onTapMinus;
  final Function()? onTapPlus;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTapMinus,
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.kAmericanSilver),
            alignment: Alignment.center,
            child: Icon(
              FontAwesomeIcons.minus,
              size: 15.sp,
            ),
          ),
        ),
        12.w.pw,
        Text(
          '$itemCount',
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kBlack,
          ),
        ),
        12.w.pw,
        InkWell(
          onTap: onTapPlus,
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.kRGPDarkSkyBlue),
            alignment: Alignment.center,
            child: Icon(
              FontAwesomeIcons.plus,
              size: 10.sp,
              color: AppColors.kMetallicSeaweed,
            ),
          ),
        ),
      ],
    );
  }
}

// class Counterx extends StatefulWidget {
//   const Counterx({
//     Key? key,
//     required this.onValueChanged,
//   }) : super(key: key);
//   final ValueChanged<int> onValueChanged;
//   @override
//   State<Counterx> createState() => _CounterxState();
// }

// class _CounterxState extends State<Counterx> {
//   int itemCount = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         InkWell(
//           onTap: () {
//             if (itemCount != 1) {
//               setState(() {
//                 widget.onValueChanged(itemCount-- - 1);
//               });
//             }
//           },
//           child: Container(
//             width: 36.w,
//             height: 36.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 color: AppColors.kAmericanSilver),
//             alignment: Alignment.center,
//             child: Icon(
//               FontAwesomeIcons.minus,
//               size: 15.sp,
//             ),
//           ),
//         ),
//         12.w.pw,
//         Text(
//           '$itemCount',
//           style: context.textTheme.bodyMedium!.copyWith(
//             color: AppColors.kBlack,
//           ),
//         ),
//         12.w.pw,
//         InkWell(
//           onTap: () {
//             setState(() {
//               widget.onValueChanged(1 + itemCount++);
//             });
//           },
//           child: Container(
//             width: 36.w,
//             height: 36.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 color: AppColors.kRGPDarkSkyBlue),
//             alignment: Alignment.center,
//             child: Icon(
//               FontAwesomeIcons.plus,
//               size: 10.sp,
//               color: AppColors.kMetallicSeaweed,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
