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
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.mercury,
            width: 1.0
          )
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: this.selected,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: this.onChangedValue,
          items: <String>['Default', 'Call', 'HomeWork']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
