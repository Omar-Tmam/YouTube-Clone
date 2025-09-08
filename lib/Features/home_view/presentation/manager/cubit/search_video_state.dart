part of 'search_video_cubit.dart';

sealed class SearchVideoState extends Equatable {
  const SearchVideoState();

  @override
  List<Object> get props => [];
}

final class SearchVideoInitial extends SearchVideoState {}

final class SearchVideoLoading extends SearchVideoState {}

final class SearchVideoSuccess extends SearchVideoState {
  final SearchModel searchModel;

const SearchVideoSuccess({required this.searchModel});
}

final class SearchVideoFailure extends SearchVideoState {
  final String errMessage;

  const SearchVideoFailure({required this.errMessage});
}
