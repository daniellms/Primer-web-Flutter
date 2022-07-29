import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
              'About', style: GoogleFonts.montserratAlternates( //montserratAlternates
              fontSize: 80, 
              // color: Colors.white70,
              fontWeight: FontWeight.bold, 
            ),
          ),
        ),
      ),
    );
  }
}