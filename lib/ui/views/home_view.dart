import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
              'Home', style: GoogleFonts.montserratAlternates( //montserratAlternates
              fontSize: 80, 
              // color: Colors.,
              fontWeight: FontWeight.bold, 
            ),
          ),
        ),
      ),
    );
  }
}