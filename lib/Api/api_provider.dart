import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_box/Features/Home/Model/news_model.dart';

import 'constants.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<NewsModel> fetchNewsData() async {
    try {
      Response response = await dio.get(Constants.baseUrl);
      log('-------Weather News Data : $response');
      return response.statusCode == 200
          ? NewsModel.fromJson(response.data)
          : throw Exception('Error Getting Data');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
