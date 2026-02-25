import 'dart:async';

import 'package:flutter/material.dart';

import '../api/api.dart';

class StockSearchController extends ChangeNotifier {
  final SearchService _service = SearchService();

  List<dynamic> results = [];
  bool isLoading = false;

  Timer? _debounce;

  void search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 600), () async {
      if (query.isEmpty) {
        results = [];
        notifyListeners();
        return;
      }

      if (query.length < 2) {
        return;
      }

      isLoading = true;
      notifyListeners();

      try {
        results = await _service.searchStocks(query);
      } catch (e) {
        results = [];
      }

      isLoading = false;
      notifyListeners();
    });
  }

  void disposeController() {
    _debounce?.cancel();
  }
}