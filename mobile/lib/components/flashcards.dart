import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashCards extends StatelessWidget {
  const FlashCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Flash Card',
          style: GoogleFonts.acme(
            textStyle: Theme.of(context).textTheme.headline4,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20.0,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black
          ),
          child: Text(
            'Go back!',
            style: GoogleFonts.acme(
              textStyle: Theme.of(context).textTheme.headline4,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
