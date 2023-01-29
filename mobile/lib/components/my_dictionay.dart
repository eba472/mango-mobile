import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Dict> fetchDict() async {
  final response = await http.get(Uri.parse('http://192.168.1.102:dict/en/apples'));
  if (response.statusCode == 200) {
    return Dict.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Dict {
  final String word;
  final String mnDef;
  final String enDef;
  final String ipa;
  final String sound;
  final List<String> examples;

  const Dict({
    required this.word,
    required this.mnDef,
    required this.enDef,
    required this.ipa,
    required this.sound,
    required this.examples,
  });

  factory Dict.fromJson(Map<String, dynamic> json) {
    return Dict(
      word: json['word'],
      mnDef: json['mnDef'],
      enDef: json['enDef'],
      ipa: json['ipa'],
      sound: json['sound'],
      examples: json['examples'],
    );
  }
}

class MyDictionary extends StatefulWidget {
  const MyDictionary({super.key});

  @override
  State<MyDictionary> createState() => _MyDictionaryState();
}

class _MyDictionaryState extends State<MyDictionary> {
  late Future<Dict> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchDict();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Dict>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.mnDef);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
