import 'package:flutter/material.dart';
import 'package:mobile/components/home/widgets/words.dart';

typedef SearchFilter<T> = List<String?> Function(T t);
typedef ResultBuilder<T> = Widget Function(T t);
typedef SortCallback<T> = int Function(T a, T b);

class SearchPage<T> extends SearchDelegate<T?> {
  final Widget suggestion;
  final Widget failure;
  final ResultBuilder<Words> builder;
  final SearchFilter<Words> filter;
  final List<Words> items;
  final ThemeData? barTheme;
  final bool itemStartsWith;
  final bool itemEndsWith;
  final ValueChanged<String>? onQueryUpdate;
  final TextStyle? searchStyle;

  SearchPage({
    this.suggestion = const SizedBox(),
    this.failure = const SizedBox(),
    required this.builder,
    required this.filter,
    required this.items,
    this.barTheme,
    this.itemStartsWith = false,
    this.itemEndsWith = false,
    this.onQueryUpdate,
    this.searchStyle,
  }) : super(
          searchFieldStyle: searchStyle,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return barTheme ??
        Theme.of(context).copyWith(
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

  bool _filterByValue({
    required String query,
    required String? value,
  }) {
    if (value == null) {
      return false;
    }
    if (itemStartsWith && itemEndsWith) {
      return value == query;
    }
    if (itemStartsWith) {
      return value.startsWith(query);
    }
    if (itemEndsWith) {
      return value.endsWith(query);
    }
    return value.contains(query);
  }

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
}
