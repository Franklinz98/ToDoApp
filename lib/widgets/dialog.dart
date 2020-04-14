import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class NewToDoDialog extends StatefulWidget {
  @override
  _NewToDoDialogState createState() => _NewToDoDialogState();
}

class _NewToDoDialogState extends State<NewToDoDialog> {
  final _formKey = GlobalKey<FormState>();
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "New To Do",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        textStyle: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: controllerTitle,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            textStyle: TextStyle(color: Colors.white)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must provide a title.';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: controllerBody,
                        decoration: InputDecoration(
                          labelText: 'Body',
                        ),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            textStyle: TextStyle(color: Colors.white)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must provide a body.';
                          }
                          return null;
                        },
                      )),
                ],
              )),
          FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                final todo = new ToDo(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  completed: 0,
                );
                controllerTitle.clear();
                controllerBody.clear();
                Navigator.of(context).pop(todo);
              }
            },
            child: Text(
              'ADD',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
            color: AppColors.puerto_rico,
          )
        ],
      ),
      backgroundColor: AppColors.java,
    );
  }
}
