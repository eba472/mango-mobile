import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mobile/components/home/widgets/words.dart';
import 'package:http/http.dart' as http;
import '../models/dict.dart';

typedef SearchFilter<T> = List<String?> Function(T t);
typedef ResultBuilder<T> = Widget Function(T t);
typedef SortCallback<T> = int Function(T a, T b);

Future<Dict> fetchDict() async {
  final res = await http.get(Uri.parse('localhost:3000/dict/en/voluminous'));
  if (res.statusCode == 200) {
    return Dict.fromJson(jsonDecode(res.body));
  } else if (res.statusCode == 404) {
    throw Exception('Word not found,');
  } else {
    throw Exception('Failed to load album');
  }
}

class SearchPage<T> extends SearchDelegate<T?> {
  final Widget suggestion = const Center(
    child: Text('Try something'),
  );
  final Widget failure = const Center(
    child: Text('No way :('),
  );
  final ResultBuilder<Words> builder;
  final SearchFilter<Words> filter;
  static const List<Words> items = [
    Words('Father'),
    Words('Mother'),
    Words('Sister'),
    Words('Brother'),
    Words('Dog'),
    Words('Apple'),
  ];

  final ValueChanged<String>? onQueryUpdate = print;

  SearchPage({
    required this.builder,
    required this.filter,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            headline6: TextStyle(
              color: Theme.of(context).primaryTextTheme.headline6?.color,
              fontSize: 20,
            ),
          ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Theme.of(context).primaryTextTheme.caption?.color,
          fontSize: 20,
        ),
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      AnimatedOpacity(
        opacity: query.isNotEmpty ? 1.0 : 0.0,
        duration: kThemeAnimationDuration,
        curve: Curves.easeInOutCubic,
        child: IconButton(
          tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    if (onQueryUpdate != null) onQueryUpdate!(query);
    final cleanQuery = query.toLowerCase().trim();
    if (cleanQuery.isEmpty) {
      return suggestion;
    }
    final searchResult = items
        .where(
          (item) => filter(item)
              .map((value) => value?.toLowerCase().trim())
              .any((value) => _filterByValue(query: cleanQuery, value: value)),
        )
        .toList();
    if (searchResult.isEmpty) {
      return failure;
    }
    return ListView(
      children: searchResult.map(builder).toList(),
    );
  }

  bool _filterByValue({
    required String query,
    required String? value,
  }) {
    if (value == null) {
      return false;
    }
    return value.contains(query);
  }
}
