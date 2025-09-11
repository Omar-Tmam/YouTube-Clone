import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void toggleTheme() {
    if (state == ThemeMode.dark) {
      emit(ThemeMode.light);
    }else {
      emit(ThemeMode.dark);
    }
  }
}
