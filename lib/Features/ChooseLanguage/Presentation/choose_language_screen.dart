import 'package:flutter/material.dart';
import 'package:news_box/Commons/app_colors.dart';
import 'package:news_box/Commons/app_icons.dart';
import 'package:news_box/Commons/app_sizes.dart';
import 'package:news_box/Features/Home/Presentation/home_screen.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  final List<String> languageList = [
    'English',
    'Hindi',
    'Bangla',
    'Telugu',
    'Tamil',
    'Malayalam',
    'Kannada',
    'Marathi',
    'Gujarati',
    'Punjabi',
    'Oriya',
    'Urdu',
    'Bhojpuri',
    'Nepali',
  ];

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.kDefaultPadding),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const Center(
                        child: Image(
                          image: AssetImage(AppIcons.appLogo),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: AppSizes.kDefaultPadding),
                      Text(
                        'Choose your Language',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )),
              const SizedBox(height: AppSizes.kDefaultPadding),
              Expanded(
                flex: 10,
                child: GridView.builder(
                    itemCount: languageList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            mainAxisExtent: 50),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = true;
                          });
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.kDefaultPadding,
                                vertical: AppSizes.dimen8),
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.shimmer,
                                border: Border.all(
                                    width: 0.5, color: AppColors.lightGrey),
                                borderRadius:
                                    BorderRadius.circular(AppSizes.dimen4)),
                            child: Center(
                                child: Text(
                              languageList[index],
                              style: Theme.of(context).textTheme.bodyText1,
                            ))),
                      );
                    }),
              ),
              Expanded(
                flex: 0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size.fromHeight(AppSizes.buttonHeight)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: Text(
                      'Confirm',
                      style: Theme.of(context).textTheme.button,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
