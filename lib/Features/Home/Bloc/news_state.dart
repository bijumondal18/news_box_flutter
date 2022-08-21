part of 'news_bloc.dart';

@immutable
abstract class NewsState  extends Equatable{
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsStateInitial extends NewsState {}

class NewsStateLoading extends NewsState {}

class NewsStateLoaded extends NewsState {
  final NewsModel newsModel;

  const NewsStateLoaded(this.newsModel);

  @override
  List<Object?> get props => [newsModel];
}

class NewsStateError extends NewsState {
  final String error;

  const NewsStateError(this.error);

  @override
  List<Object?> get props => [error];
}
