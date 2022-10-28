// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile/search_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Words implements Comparable<Words> {
  final String chars;

  const Words(this.chars);

  @override
  int compareTo(Words other) => chars.compareTo(other.chars);
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'search_page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const word = [
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
            color: Color.fromARGB(255, 255, 255, 255),
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
            child: Text(
              'Flash cards',
              style: GoogleFonts.acme(
                textStyle: TextStyle(color: Colors.blue, letterSpacing: .5),
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 16.0,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FlashCards()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black
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
            items: word,
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
        child: const Icon(Icons.search),
      ),
    );
  }
}

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
          child: Text(
            'Go back!',
            style: GoogleFonts.acme(
              textStyle: Theme.of(context).textTheme.headline4,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 16.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black
          ),
        ),
      ),
    );
  }
}
