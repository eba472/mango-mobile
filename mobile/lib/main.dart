import 'package:flutter/material.dart';

void main() {
  runApp(const app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(

        // Scaffold Widget
        home: Scaffold(
      appBar: AppBar(
        // AppBar takes a Text Widget
        // in it's title parameter
        title: const Text('Mango Dict'),
      ),
      body: const Center(child: Text('Hello World')),
    ));
  }
}
