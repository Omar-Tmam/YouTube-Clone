import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_clone/Features/home_view/data/models/search_model/search_model.dart';
import 'package:youtube_clone/Features/home_view/data/repos/search_repo.dart';

part 'search_video_state.dart';

class SearchVideoCubit extends Cubit<SearchVideoState> {
  SearchVideoCubit(this.searchRepo) : super(SearchVideoInitial());
  final SearchRepo searchRepo;
  Future<void> getVideo(String value) async {
    emit(SearchVideoLoading());

    var data = await searchRepo.getVideo(value: value);
    data.fold((error) {
      emit(SearchVideoFailure(errMessage: error.errMessage));
    }, (data) {
      emit(SearchVideoSuccess(searchModel: data));
    });
  }
}
