import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_model/related_model.dart';
import 'package:youtube_clone/Features/video_details/data/repos/related_repo/related_repo.dart';

part 'related_state.dart';

class RelatedCubit extends Cubit<RelatedState> {
  final RelatedRepo relatedRepo;
  RelatedCubit(this.relatedRepo) : super(RelatedInitial());
  Future<void> getRelated(String id) async {
    emit(RelatedLoading());
    var data = await relatedRepo.getRelated(id: id);
    data.fold((error) {
      emit(RelatedFailure(errMessage: error.errMessage));
    }, (relatedModel) {
      emit(RelatedSuccess(relatedModel: relatedModel));
    });
  }
}
