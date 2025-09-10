part of 'comment_cubit.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

final class CommentLoading extends CommentState {}

final class CommentSucess extends CommentState {
  final CommentModel commentModel;

  const CommentSucess({required this.commentModel});
}

final class CommentFailure extends CommentState {
  final String errMessage;

  const CommentFailure({required this.errMessage});
}
