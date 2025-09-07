import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'featured_videos_state.dart';

class FeaturedVideosCubit extends Cubit<FeaturedVideosState> {
  FeaturedVideosCubit() : super(FeaturedVideosInitial());
}
