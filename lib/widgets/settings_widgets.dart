import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/repo_bloc/repo_bloc.dart';
import 'package:yaru/yaru.dart';

class TileWithSliderAndInfo extends StatelessWidget {
  final String textInfo;
  final double valueRequested;
  final int valueChanged;
  final double max4Slider;
  final double min4Slider;
  const TileWithSliderAndInfo(
      {super.key,
      required this.textInfo,
      required this.valueRequested,
      required this.valueChanged,
      required this.max4Slider,
      required this.min4Slider});

  @override
  Widget build(BuildContext context) {
    return YaruTile(
      style: YaruTileStyle.banner,
      title: Text(textInfo),
      subtitle: Text("min: $valueRequested"),
      leading: Slider(
          min: min4Slider,
          max: max4Slider,
          value: valueRequested,
          label: "min",
          onChanged: (newValue) {
            BlocProvider.of<RepoBloc>(context).add(UpdateSettingVariables(
                selectedToChange: valueChanged, changedVar: newValue.toInt()));
          }),
    );
  }
}
