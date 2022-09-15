// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mobile/search_page.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
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
    Words('Dad'),
    Words('Mum'),
    Words('Sister'),
    Words('Brother'),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: ListView.builder(
        itemCount: word.length,
        itemBuilder: (context, index) {
          final word_s = word[index];

          return ListTile(
            title: Text(word_s.chars),
            subtitle: Text('Explanation'),
          );
        },
      ),
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
            filter: (word_s) => [
              word_s.chars,
            ],
            builder: (word_s) => ListTile(
              title: Text(word_s.chars),
            ),
          ),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
