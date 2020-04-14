import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/colors.dart';

class DismissibleBackground extends StatelessWidget {
  final double alignment;

  const DismissibleBackground({Key key, @required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mine_shaft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment(this.alignment, 0.0),
      child: Text(
        'ELIMINAR',
        style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            textStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
