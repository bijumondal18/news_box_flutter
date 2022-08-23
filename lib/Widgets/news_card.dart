import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../Commons/app_colors.dart';
import '../Commons/app_sizes.dart';
import '../Utils/app_utils.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final String author;
  final String time;
  final VoidCallback onPressed;

  const NewsCard(
      {Key? key,
      required this.title,
      required this.desc,
      required this.image,
      required this.author,
      required this.time,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSizes.cardCornerRadius),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    )),
              ),
            ),
            const SizedBox(
              width: AppSizes.dimen8,
            ),
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: AppSizes.kDefaultPadding),
                      const Icon(EvaIcons.bookmarkOutline)
                    ],
                  ),
                  // const SizedBox(
                  //   height: AppSizes.dimen8,
                  // ),
                  // Text(
                  //   desc,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: Theme.of(context).textTheme.bodyText2,
                  // ),
                  const SizedBox(
                    height: AppSizes.kDefaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              author,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              AppUtils.getTimeFromDateString(time),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
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
          ],
        ),
      ),
    );
  }
}
