import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        'Home page',
        style: GoogleFonts.acme(
          textStyle: Theme.of(context).textTheme.headline4,
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 20.0,
        ),
      ),
    );
  }
}
