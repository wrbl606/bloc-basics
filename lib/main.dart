import 'package:bloc_example/widgets/color_component_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/bloc/color_generator_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => ColorGeneratorBloc(),
          child: const MainPage(),
        ),
      );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ColorGeneratorBloc, ColorGeneratorState>(
        builder: (context, state) => Scaffold(
          backgroundColor: state.color,
          body: Row(
            children: [
              Expanded(
                child: ColorComponentPicker(
                  onSelectedItemChanged: (red) => context
                      .read<ColorGeneratorBloc>()
                      .add(GenerateSeededColor(red: red)),
                ),
              ),
              Expanded(
                child: ColorComponentPicker(
                  onSelectedItemChanged: (green) => context
                      .read<ColorGeneratorBloc>()
                      .add(GenerateSeededColor(green: green)),
                ),
              ),
              Expanded(
                child: ColorComponentPicker(
                  onSelectedItemChanged: (blue) => context
                      .read<ColorGeneratorBloc>()
                      .add(GenerateSeededColor(blue: blue)),
                ),
              ),
            ],
          ),
        ),
      );
}
