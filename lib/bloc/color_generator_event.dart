part of 'color_generator_bloc.dart';

abstract class ColorGeneratorEvent {}

class GenerateSeededColor extends ColorGeneratorEvent with EquatableMixin {
  final int? red;
  final int? green;
  final int? blue;

  GenerateSeededColor({this.red, this.green, this.blue});

  @override
  List<Object?> get props => [red, green, blue];
}
