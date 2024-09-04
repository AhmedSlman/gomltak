import 'package:cached_network_image/cached_network_image.dart';
import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gomltak/features/market_feature/data/models/details_cart_model/product.dart';

import '../../../../../core/widgets/const_price_and_discound.dart';

class ItemsInCart extends StatelessWidget {
  const ItemsInCart({
    required this.listItemsCart,
    required this.index,
    super.key,
  });
  // final CartModel? itemPordactesToCart;
  final int index;
  final List<Product> listItemsCart;
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
                  'https://gomltak.com/Backend/${listItemsCart[index].data?.image}',
              fit: BoxFit.cover,
              alignment: Alignment.center,
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
                  listItemsCart[index].data?.title ?? '',
                  style: context.textTheme.titleSmall,
                ),
                // 4.h.ph,                const Spacer(),

                Text(
                  listItemsCart[index].data?.desc ?? '',
                  style: context.textTheme.bodySmall,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    constPriceAndDiscound(
                      context: context,
                      // originalPrice:
                      //     '${listItemsCart[index].data?.price ?? ''}',
                      sellingPrice: '${listItemsCart[index].data?.price ?? ''}',
                    ),
                    // Counter(
                    //   itemCount:
                    //       CartCubit.get(context).listItemsCart[index].data.quantity,
                    //   onTapMinus: () {
                    //     CartCubit.get(context).minusItemNumber(index);
                    //   },
                    //   onTapPlus: () {
                    //     CartCubit.get(context).plusItemNumber(index);
                    //   },
                    // ),
                  ],
                )
              ],
            ),
          ),

          // 14.w.pw,
        ],
      ),
    );
  }
}
