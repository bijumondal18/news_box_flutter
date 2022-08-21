import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_box/Commons/app_colors.dart';
import 'package:news_box/Commons/app_sizes.dart';
import 'package:news_box/Features/Home/Bloc/news_bloc.dart';
import 'package:news_box/Widgets/custom_loader.dart';

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
          SliverToBoxAdapter(
            child: BlocProvider(
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
                    return ListView.separated(
                      itemCount: state.newsModel.articles!.length,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.all(AppSizes.kDefaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.newsModel.articles![index].title
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  const SizedBox(
                                      width: AppSizes.kDefaultPadding),
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
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(state
                                          .newsModel.articles![index].urlToImage
                                          .toString()),
                                    )),
                              ),
                              const SizedBox(
                                height: AppSizes.dimen8,
                              ),
                              Text(
                                state.newsModel.articles![index].description
                                    .toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              const SizedBox(
                                height: AppSizes.kDefaultPadding,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${state.newsModel.articles![index].source!.name} \u2022 ${state.newsModel.articles![index].publishedAt}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
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
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
