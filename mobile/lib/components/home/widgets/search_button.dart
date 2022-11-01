import 'package:flutter/material.dart';
import '../../search_page.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Search words',
      onPressed: () => showSearch(
        context: context,
        delegate: SearchPage(
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
