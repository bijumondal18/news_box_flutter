import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_box/Api/constants.dart';
import 'package:news_box/Features/Home/Model/news_model.dart';
import 'package:news_box/Features/Home/Repository/news_repository.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsStateInitial()) {
    final NewsRepository repository = NewsRepository();

    on<NewsEvent>((event, emit) async {
      try {
        emit(NewsStateLoading());
        final mData = await repository.fetchWeatherData();
        emit(NewsStateLoaded(mData));
      } catch (e) {
        emit(NewsStateError(e.toString()));
      }
    });
  }
}
