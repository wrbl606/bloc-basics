part of 'color_generator_bloc.dart';

abstract class ColorGeneratorState extends Equatable {
  final Color color;

  const ColorGeneratorState({this.color = Colors.black});

  @override
  List<Object?> get props => [color];
}

class InitialState extends ColorGeneratorState {}

class ColorState extends ColorGeneratorState {
  const ColorState(Color color) : super(color: color);
}
