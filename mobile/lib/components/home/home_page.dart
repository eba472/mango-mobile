import 'package:flutter/material.dart';
import 'widgets/appbar.dart';
import 'widgets/new_search_button.dart';
import 'widgets/search_button.dart';

class MyHomePage extends StatelessWidget {
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
                SizedBox(width: 300.0, height: 20.0, child: NewSearchButton())),
        floatingActionButton: SearchButton());
  }
}
