import 'package:flutter/material.dart';
import 'package:ngo_hackathon/features/filter_search/filter_search_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const FilterSearch();
  }
}