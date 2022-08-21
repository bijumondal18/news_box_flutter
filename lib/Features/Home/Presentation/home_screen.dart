import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_box/Commons/app_colors.dart';
import 'package:news_box/Commons/app_sizes.dart';
import 'package:news_box/Widgets/custom_card.dart';
import 'package:news_box/Widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  final List<Widget> tabs = const [
    Tab(text: 'Latest'),
    Tab(text: 'India'),
    Tab(text: 'World'),
    Tab(text: 'Business'),
    Tab(text: 'Technology'),
    Tab(text: 'Entertainment'),
    Tab(text: 'Sports'),
    Tab(text: 'Science'),
    Tab(text: 'Health'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            elevation: 0.6,
            floating: true,
            pinned: true,
            snap: false,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.search,
                  size: 24,
                )),
            title: const Text('Daily News'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    EvaIcons.bellOutline,
                    size: 24,
                  )),
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.black,
              labelStyle: const TextStyle(
                  fontSize: AppSizes.bodyText1, fontWeight: FontWeight.w700),
              unselectedLabelStyle: const TextStyle(
                  fontSize: AppSizes.bodyText1, fontWeight: FontWeight.w400),
              controller: tabController,
              //indicator: const BoxDecoration(),
              tabs: tabs,
              isScrollable: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ListView.separated(
              itemCount: 130,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
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
                              'Japan PM Fumio Kishida infected with COVID-19',
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
                            borderRadius: BorderRadius.circular(
                                AppSizes.cardCornerRadius),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/08/breakingnews-live-blog-1568185450-1595123397-1598233436.jpg'),
                            )),
                      ),
                      const SizedBox(
                        height: AppSizes.dimen8,
                      ),
                      Text(
                        'Japan PM Fumio Kishida infected with COVID-19, Japan PM Fumio Kishida infected with COVID-19, Japan PM Fumio Kishida infected with COVID-19Japan PM Fumio Kishida infected with COVID-19Japan PM Fumio Kishida infected with COVID-19Japan PM Fumio Kishida infected with COVID-19Japan PM Fumio Kishida infected with COVID-19Japan PM Fumio Kishida infected with COVID-19',
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
                              'Google-News \u2022 33m',
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
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
          ]))
        ],
      ),
    );
  }
}
