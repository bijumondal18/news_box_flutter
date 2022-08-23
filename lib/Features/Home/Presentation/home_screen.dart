import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_box/Commons/app_colors.dart';
import 'package:news_box/Commons/app_sizes.dart';
import 'package:news_box/Features/Details/Presentation/details_screen.dart';
import 'package:news_box/Features/Home/Bloc/news_bloc.dart';
import 'package:news_box/Utils/app_utils.dart';
import 'package:news_box/Widgets/custom_loader.dart';
import 'package:news_box/Widgets/news_card.dart';
import 'package:news_box/Widgets/news_container.dart';

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
  final NewsBloc newsBloc = NewsBloc();
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
    newsBloc.add(GetNewsDataEvent());
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
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
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
                      fontSize: AppSizes.bodyText1,
                      fontWeight: FontWeight.w700),
                  unselectedLabelStyle: const TextStyle(
                      fontSize: AppSizes.bodyText1,
                      fontWeight: FontWeight.w400),
                  controller: tabController,
                  //indicator: const BoxDecoration(),
                  tabs: tabs,
                  isScrollable: true,
                ),
              ),
            ];
          },
          body: BlocProvider(
            create: (context) => newsBloc,
            child: BlocConsumer<NewsBloc, NewsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is NewsStateInitial) {
                  return const CustomLoader();
                }
                if (state is NewsStateLoading) {
                  return const CustomLoader();
                }
                if (state is NewsStateError) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                if (state is NewsStateLoaded) {
                  return TabBarView(
                    controller: tabController,
                    children: [
                      RefreshIndicator(
                        color: AppColors.primary,
                        key: refreshKey,
                        onRefresh: () async {
                          await Future.delayed(
                              const Duration(milliseconds: 2000));
                          newsBloc.add(GetNewsDataEvent());
                        },
                        child: ListView.separated(
                          itemCount: state.newsModel.articles!.length,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return index == 0
                                ? NewsContainer(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
                                                      article: state.newsModel
                                                          .articles![index])));
                                    },
                                    title: state
                                        .newsModel.articles![index].title
                                        .toString(),
                                    desc: state
                                        .newsModel.articles![index].description
                                        .toString(),
                                    image: state
                                        .newsModel.articles![index].urlToImage
                                        .toString(),
                                    author: state
                                        .newsModel.articles![index].source!.name
                                        .toString(),
                                    time: state
                                        .newsModel.articles![index].publishedAt
                                        .toString(),
                                  )
                                : NewsCard(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
                                                      article: state.newsModel
                                                          .articles![index])));
                                    },
                                    title: state
                                        .newsModel.articles![index].title
                                        .toString(),
                                    desc: state
                                        .newsModel.articles![index].description
                                        .toString(),
                                    image: state
                                        .newsModel.articles![index].urlToImage
                                        .toString(),
                                    author: state
                                        .newsModel.articles![index].source!.name
                                        .toString(),
                                    time: state
                                        .newsModel.articles![index].publishedAt
                                        .toString(),
                                  );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              height: 0,
                            );
                          },
                        ),
                      ),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
