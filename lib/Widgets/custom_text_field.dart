import 'package:flutter/material.dart';
import 'package:news_box/Commons/app_colors.dart';

import '../Commons/app_sizes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: AppSizes.textFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.shimmer,
        border: Border.all(width: 1, color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(AppSizes.cardCornerRadius)
      ),
      child: TextFormField(
        //autofocus: true,
        //onChanged: (value) => BlocProvider.of<SearchedLocationBloc>(context).add(GetSearchedLocationEvent(controller.text.trim().toLowerCase())),
        controller: controller,
        decoration: const InputDecoration(
            hintText: 'Search news here',
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20),
            border: UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
