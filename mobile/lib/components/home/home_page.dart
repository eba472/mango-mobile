import 'package:flutter/material.dart';

import 'widgets/appbar.dart';
import 'widgets/flashcard_button.dart';
import 'widgets/search_button.dart';
import 'widgets/words.dart';

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
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: MyAppBar(),
        ),
        body: Center(
            child:
                SizedBox(width: 300.0, height: 20.0, child: FlashCardButton())),
        floatingActionButton: SearchButton(
          words: words,
        ));
  }
}
