import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../flashcards.dart';

class FlashCardButton extends StatelessWidget {
  const FlashCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FlashCards()),
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: Text(
          'Flash cards',
          style: GoogleFonts.acme(
            textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5),
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
