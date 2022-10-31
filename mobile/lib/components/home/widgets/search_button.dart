import 'package:flutter/material.dart';
import 'words.dart';
import '../../search_page.dart';

class SearchButton extends StatelessWidget {
  final List<Words> words;

  const SearchButton({super.key, required this.words});
  
  @override
  Widget build(BuildContext context) {
    debugPrint(words[0].chars);
    return FloatingActionButton(
        tooltip: 'Search words',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage(
            onQueryUpdate: print,
            items: words,
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
      );
  }
}