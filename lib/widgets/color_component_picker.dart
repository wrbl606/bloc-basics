import 'package:bloc_example/bloc/color_generator_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorComponentPicker extends StatelessWidget {
  final int optionsCount;
  final void Function(int?)? onSelectedItemChanged;

  const ColorComponentPicker({
    Key? key,
    this.onSelectedItemChanged,
    this.optionsCount = 256,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoPicker.builder(
        itemExtent: 20,
        onSelectedItemChanged: (itemIndex) =>
            onSelectedItemChanged?.call(itemIndex),
        itemBuilder: (context, index) =>
            BlocBuilder<ColorGeneratorBloc, ColorGeneratorState>(
          builder: (context, state) => Text(
            '$index',
            style: TextStyle(
              color: state.color.computeLuminance() > .5
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
        childCount: optionsCount,
      );
}
