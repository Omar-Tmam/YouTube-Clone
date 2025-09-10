import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_clone/Features/video_details/data/models/comment_model/comment_model.dart';
import 'package:youtube_clone/Features/video_details/data/repos/comment_repo/comment_repo.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.commenteRepo) : super(CommentInitial());
  final CommentRepo commenteRepo;
  Future<void> getComment(String id) async {
    emit(CommentLoading());
    var data = await commenteRepo.getComment(id: id);
    data.fold((error) {
      emit(CommentFailure(errMessage: error.errMessage));
    }, (commentModel) {
      emit(CommentSucess(commentModel: commentModel));
    });
  }
}
