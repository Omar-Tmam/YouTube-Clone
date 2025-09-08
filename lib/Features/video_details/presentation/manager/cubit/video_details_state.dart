part of 'video_details_cubit.dart';

sealed class VideoDetailsState extends Equatable {
  const VideoDetailsState();

  @override
  List<Object> get props => [];
}

final class VideoDetailsInitial extends VideoDetailsState {}

final class VideoDetailsLoading extends VideoDetailsState {}

final class VideoDetailsSuccess extends VideoDetailsState {
  final VideoDetailModel videoDetailModel;

const VideoDetailsSuccess({required this.videoDetailModel});
}

final class VideoDetailsFailure extends VideoDetailsState {
  final String errMessage;

  const VideoDetailsFailure({required this.errMessage});
}
