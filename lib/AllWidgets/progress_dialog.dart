import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class progressDialog extends StatelessWidget {
  final String message;
  progressDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: 6.0),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
            SizedBox(width: 26.0),
            Text(
              message,
              style: GoogleFonts.lato(fontSize: 10.0, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
