part of 'featured_videos_cubit.dart';

sealed class FeaturedVideosState extends Equatable {
  const FeaturedVideosState();

  @override
  List<Object> get props => [];
}

final class FeaturedVideosInitial extends FeaturedVideosState {}

final class FeaturedVideosLoading extends FeaturedVideosState {}

final class FeaturedVideosSuccess extends FeaturedVideosState {
  final List<SearchModel> videos;

const  FeaturedVideosSuccess({required this.videos});
}

final class FeaturedVideosFailure extends FeaturedVideosState {
  final String errMessage;

  const FeaturedVideosFailure({required this.errMessage});
}
