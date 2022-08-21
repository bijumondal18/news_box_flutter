import 'package:flutter/material.dart';
import 'package:news_box/Commons/app_colors.dart';
import 'package:news_box/Commons/app_sizes.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.kDefaultPadding),
      padding: const EdgeInsets.all(AppSizes.dimen8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
      ),
      child: child,
    );
  }
}
