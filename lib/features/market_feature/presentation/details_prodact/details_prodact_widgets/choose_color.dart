// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gomltak/features/market_feature/data/models/details_prodact_model/color.dart';

class ChooseColor extends StatefulWidget {
  const ChooseColor({
    Key? key,
    this.hexaColor,
    this.onChanged,
  }) : super(key: key);
  final List<ColorPoducts>? hexaColor;
  final void Function(int?)? onChanged;

  @override
  State<ChooseColor> createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  bool isChickedColor = false;

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 150.w,
      height: 22.0.w,
      child: Row(
        children: widget.hexaColor?.asMap().entries.map((entry) {
              final index = entry.key;
              // final color = entry.value;
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedIndex = index;
                      widget.onChanged!(entry.value.id);
                      // print(entry.value.id);
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    margin: EdgeInsetsDirectional.only(end: 8.w),
                    width: 22.0.w,
                    height: 22.0.w,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      color: Color(int.parse(
                          '0xFF${widget.hexaColor?[index].color?.replaceAll("#", "") ?? '000000'}')),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }
}

// ListView newMethod() {
//   return ListView.separated(
//     scrollDirection: Axis.horizontal,
//     itemCount: widget.hexaColor?.length ?? 0,
//     separatorBuilder: (context, index) => SizedBox(
//       width: 8.w,
//     ),
//     itemBuilder: (context, index) {
//       return ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(100)),
//         child: InkWell(
//           child: Container(
//             width: 22.w,
//             height: 22.w,
//             color: Color(int.parse(
//                 '0xFF${widget.hexaColor?[index].color?.replaceAll("#", "") ?? '000000'}')),
//           ),
//         ),
//       );
//     },
//   );
// }
