import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_model/related_model.dart';

part 'related_state.dart';

class RelatedCubit extends Cubit<RelatedState> {
  RelatedCubit() : super(RelatedInitial());
}
