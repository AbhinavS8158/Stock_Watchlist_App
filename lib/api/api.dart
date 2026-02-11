import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchService {
  static const String apiKey = 'QUNJQC8PUCTW2VY3';

  Future<List<dynamic>> searchStocks(String query) async {
    if (query.isEmpty) return [];
    
    final url = Uri.parse(
      'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$query&apikey=$apiKey'
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['bestMatches'] ?? [];
    }
    return [];
  }
}