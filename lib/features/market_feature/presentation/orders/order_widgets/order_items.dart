import 'package:cached_network_image/cached_network_image.dart';
import 'package:gomltak/core/utils/app_colors.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/features/market_feature/data/models/my_orders_model/product.dart';

import '../../../../../core/widgets/const_price_and_discound.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    this.product,
    super.key,
  });
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 341.w,
      height: 100.h,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
                  'https://gomltak.com/Backend/${product?.image ?? 'uploads/thumbnails/products/image/2023-02-28/Rectangle 10807.png-_-1677583380.png'}',
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              height: 100.h,
              width: 102.w,
            ),
          ),
          14.w.pw,
          SizedBox(
            width: 210.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product?.name}',
                  style: context.textTheme.titleSmall,
                ),
                4.h.ph,
                Text(
                  '${product?.desc} ',
                  style: context.textTheme.bodySmall,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // priceAndDiscound(context),
                    constPriceAndDiscound(context: context),
                    Text(
                      '${product?.date}',
                      style: context.textTheme.bodySmall!
                          .copyWith(color: AppColors.kDarkGray),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
