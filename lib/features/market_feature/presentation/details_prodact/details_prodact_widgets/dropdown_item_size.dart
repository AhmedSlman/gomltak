import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/app_string.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/features/market_feature/data/models/details_prodact_model/size.dart';

class DropDownItemsSize extends StatefulWidget {
  const DropDownItemsSize({
    this.listSize,
    required this.onChanged,
    super.key,
  });
  final List<SizeProdactDetails>? listSize;
  final void Function(String?)? onChanged;
  @override
  State<DropDownItemsSize> createState() => _DropDownItemsSizeState();
}

class _DropDownItemsSizeState extends State<DropDownItemsSize> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppString.size,
          style: context.textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        12.w.pw,
        Container(
          width: 55.w,
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
            color: AppColors.kRGPDarkSkyBlue,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                focusColor: AppColors.kTransparent,
                // dropdownColor: AppColors.kTransparent,
                iconSize: 20.sp,
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColors.kMetallicSeaweed,
                ),
                value: selectedValue ?? widget.listSize![0].size,
                style: const TextStyle(color: AppColors.kBlack),
                items: widget.listSize
                    ?.map((size) => DropdownMenuItem(
                          value: size.size,
                          child: Text(
                            '${size.size}',
                            style: context.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.kMetallicSeaweed),
                          ),
                        ))
                    .toList(),
                onChanged: (selected) {
                  widget.listSize?.forEach((element) {
                    if (selected == element.size) {
                      widget.onChanged!(element.id.toString());
                    }
                  });
                  setState(() {
                    // widget.onChanged!(selectedValue![1]);
                    selectedValue = selected;
                  });
                }),
          ),
        ),
      ],
    );
  }
}
