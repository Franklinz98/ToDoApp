import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/screens/home.dart';

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
          primaryColor: AppColors.mercury,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                textStyle: TextStyle(color: AppColors.mercury)),
            errorStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                textStyle: TextStyle(color: AppColors.mine_shaft)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mercury),
              //  when the TextFormField in unfocused
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              //  when the TextFormField in focused
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mine_shaft),
              //  when the TextFormField in focused
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mine_shaft),
              //  when the TextFormField in focused
            ),
            border: UnderlineInputBorder(),
          )),
      home: Home(),
    );
  }
}
