import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_generator_event.dart';
part 'color_generator_state.dart';

class ColorGeneratorBloc
    extends Bloc<ColorGeneratorEvent, ColorGeneratorState> {
  ColorGeneratorBloc() : super(InitialState()) {
    on<GenerateSeededColor>(_generateSeededColor);
  }

  FutureOr<void> _generateSeededColor(
    GenerateSeededColor event,
    Emitter<ColorGeneratorState> emit,
  ) {
    final color = Color.fromARGB(
      255,
      event.red ?? state.color.red,
      event.green ?? state.color.green,
      event.blue ?? state.color.blue,
    );
    emit(ColorState(color));
  }
}
