import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class ListItem extends StatelessWidget {
  final ToDo todo;
  final VoidCallback onPressed;

  const ListItem({Key key, @required this.todo, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          leading: Image.asset(
            'assets/images/item_icon.png',
            height: 36.0,
            width: 36.0,
          ),
          title: Text(
            this.todo.title,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                textStyle: TextStyle(color: Colors.black)),
          ),
          subtitle: Text(
            this.todo.body,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                textStyle: TextStyle(color: Colors.black)),
          ),
          isThreeLine: true,
          dense: true,
          trailing: Icon(
            Icons.check_circle_outline,
            size: 24.0,
            color:
                todo.completed == 1 ? AppColors.puerto_rico : AppColors.mercury,
          ),
          onTap: this.onPressed,
        ),
      ),
    );
  }
}
