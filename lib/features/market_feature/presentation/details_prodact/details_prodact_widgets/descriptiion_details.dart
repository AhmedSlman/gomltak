import 'package:gomltak/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:gomltak/features/market_feature/presentation/details_prodact/cubit/details_prodact_cubit.dart';

class DescriptionDetails extends StatelessWidget {
  const DescriptionDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      '${DetailsProdactCubit.get(context).poducts.desc}',
      style: context.textTheme.bodyLarge,
    );
  }
}
