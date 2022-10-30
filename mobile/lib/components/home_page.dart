import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_page.dart';
import 'flashcards.dart';

class MyHomePage extends StatelessWidget {
  static const words = [
    Words('Father'),
    Words('Mother'),
    Words('Sister'),
    Words('Brother'),
    Words('Dog'),
    Words('Apple'),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
          child: SizedBox(
        width: 300.0,
        height: 20.0,
        child: FloatingActionButton(
          onPressed: () {},
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FlashCards()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            child: Text(
              'Flash cards',
              style: GoogleFonts.acme(
                textStyle: const TextStyle(color: Colors.blue, letterSpacing: .5),
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search words',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage(
            onQueryUpdate: print,
            items: words,
            searchLabel: 'Search words',
            suggestion: const Center(
              child: Text('Try something'),
            ),
            failure: const Center(
              child: Text('No way :('),
            ),
            filter: (wordS) => [
              wordS.chars,
            ],
            builder: (wordS) => ListTile(
              title: Text(wordS.chars),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        child: const Icon(Icons.search),
      ),
    );
  }
}

class Words implements Comparable<Words> {
  final String chars;

  const Words(this.chars);

  @override
  int compareTo(Words other) => chars.compareTo(other.chars);
}