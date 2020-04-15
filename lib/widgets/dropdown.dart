import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class DropdownType extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChangedValue;

  const DropdownType(
      {Key key, @required this.selected, @required this.onChangedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> options = <String>['Default', 'Call', 'HomeWork'];
    // TODO: implement build
    return DropdownButton<String>(
      isExpanded: true,
      value: this.selected,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: AppColors.mine_shaft),
      underline: Container(
        height: 2,
        color: AppColors.mercury,
      ),
      onChanged: this.onChangedValue,
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
