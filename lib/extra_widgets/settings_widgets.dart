import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focuzd/blocs/blocs.dart';
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

class SettingsCardSpinBox extends StatelessWidget {
  // to replace the above widget
  const SettingsCardSpinBox(
      {super.key,
      required this.value,
      required this.changeable,
      required this.label,
      required this.kind});
  final dynamic value;
  final int changeable;
  final String label;
  final String kind;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 101,
          child: YaruSection(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              YaruIconButton(
                alignment: Alignment.topCenter,
                icon: Icon(Icons.minimize_outlined,
                    color: Theme.of(context).primaryColor),
                onPressed: () {
                  var newvalue = value - 1;
                  if (newvalue <= 0) {
                    BlocProvider.of<RepoBloc>(context).add(
                        UpdateSettingVariables(
                            selectedToChange: changeable, changedVar: 1));
                  } else {
                    BlocProvider.of<RepoBloc>(context).add(
                        UpdateSettingVariables(
                            selectedToChange: changeable,
                            changedVar: newvalue));
                  }
                },
              ),
              Column(children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  value.toString(),
                  style: TextStyle(
                      fontSize: 25, color: Theme.of(context).primaryColor),
                ),
                Text(kind),
              ]),
              YaruIconButton(
                icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
                onPressed: () {
                  var newvalue = value + 1;
                  BlocProvider.of<RepoBloc>(context).add(UpdateSettingVariables(
                      selectedToChange: changeable, changedVar: newvalue));
                },
              ),
            ],
          ))),
    );
  }
}
