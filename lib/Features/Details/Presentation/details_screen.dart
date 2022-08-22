import 'package:flutter/material.dart';
import 'package:news_box/Features/Home/Bloc/news_bloc.dart';
import 'package:news_box/Features/Home/Model/news_model.dart';
import 'package:news_box/Utils/app_utils.dart';

import '../../../Commons/app_sizes.dart';

class DetailsScreen extends StatelessWidget {
  final Articles article;

  const DetailsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSizes.cardCornerRadius),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(article.urlToImage.toString()),
                    )),
              ),
              const SizedBox(height: AppSizes.dimen8),
              Text(
                article.title.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: AppSizes.dimen8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.source!.name.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    AppUtils.getTimeFromDateString(
                        article.publishedAt.toString()),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.dimen8),
              Text(
                article.content.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
