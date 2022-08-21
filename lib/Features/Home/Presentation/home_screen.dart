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
    Tab(text: 'Movies'),
    Tab(text: 'Politics'),
    Tab(text: 'Culture'),
    Tab(text: 'Science'),
    Tab(text: 'Technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 24,
            )),
        title: const Text('News Box'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 24,
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              CustomTextField(controller: searchController),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.primary,
                labelStyle: const TextStyle(
                    fontSize: AppSizes.bodyText1, fontWeight: FontWeight.w700),
                unselectedLabelStyle: const TextStyle(
                    fontSize: AppSizes.bodyText1, fontWeight: FontWeight.w400),
                controller: tabController,
                indicator: const BoxDecoration(),
                tabs: tabs,
                isScrollable: true,
              ),
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: [
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
