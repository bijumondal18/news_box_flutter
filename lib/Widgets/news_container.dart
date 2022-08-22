import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Utils/app_utils.dart';

class NewsContainer extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final String author;
  final String time;
  final VoidCallback onPressed;


  const NewsContainer(
      {Key? key,
      required this.title,
      required this.desc,
      required this.image,
      required this.author,
      required this.time, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const SizedBox(width: AppSizes.kDefaultPadding),
                const Icon(EvaIcons.bookmarkOutline)
              ],
            ),
            const SizedBox(
              height: AppSizes.dimen8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  )),
            ),
            const SizedBox(
              height: AppSizes.dimen8,
            ),
            Text(
              desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: AppSizes.kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '$author \u2022 ${AppUtils.getTimeFromDateString(time)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.whatsapp,
                      color: AppColors.green,
                    ),
                    SizedBox(width: AppSizes.dimen8),
                    Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.darkGrey,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
