import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/components/my_dictionay.dart';
import '../../flashcards.dart';

class NewSearchButton extends StatelessWidget {
  const NewSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "btn1",
      onPressed: () {},
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyDictionary()),
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: Text(
          'New search',
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
