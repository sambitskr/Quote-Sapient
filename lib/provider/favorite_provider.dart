import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _quotes = [];
  List<String> get quotes => _quotes;
  final List<String> _authors = [];
  List<String> get authors => _authors;

  void toggleFavourite(String quote, String author) {
    final isExist = _quotes.contains(quote);
    final isExistt = _authors.contains(author);
    if (isExist) {
      _quotes.remove(quote);
    } else {
      _quotes.add(quote);
    }
    if (isExistt) {
      _authors.remove(author);
    } else {
      _authors.add(author);
    }
    notifyListeners();
  }

  bool isExist(String quote) {
    final isExist = _quotes.contains(quote);
    return isExist;
  }
}
