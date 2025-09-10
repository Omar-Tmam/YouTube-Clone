import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'related_state.dart';

class RelatedCubit extends Cubit<RelatedState> {
  RelatedCubit() : super(RelatedInitial());
}
