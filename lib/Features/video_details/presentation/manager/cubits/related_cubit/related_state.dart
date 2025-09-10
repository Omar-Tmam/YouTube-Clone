part of 'related_cubit.dart';

sealed class RelatedState extends Equatable {
  const RelatedState();

  @override
  List<Object> get props => [];
}

final class RelatedInitial extends RelatedState {}

final class RelatedLoading extends RelatedState {}

final class RelatedSuccess extends RelatedState {
  final RelatedModel relatedModel;

  const RelatedSuccess({required this.relatedModel});
}

final class RelatedFailure extends RelatedState {
  final String errMessage;

 const RelatedFailure({required this.errMessage});
}
