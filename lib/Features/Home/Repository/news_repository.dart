import 'package:news_box/Features/Home/Model/news_model.dart';

import '../../../Api/api_provider.dart';

class NewsRepository {
  final ApiProvider apiProvider = ApiProvider();

  Future<NewsModel> fetchWeatherData() {
    return apiProvider.fetchNewsData();
  }
}
