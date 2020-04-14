import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/app/app.dart';

import 'constants/colors.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.java,
      statusBarBrightness: Brightness.light
    )
  );
  runApp(ToDoApp());
}