import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchService {
  static const String apiKey = 'QUNJQC8PUCTW2VY3';
  static const String baseUrl = 'https://www.alphavantage.co';

  Future<List<dynamic>> searchStocks(String query) async {
    if (query.isEmpty) return [];

    final url = Uri.parse(
      '$baseUrl/query?function=SYMBOL_SEARCH&keywords=$query&apikey=$apiKey',
    );

    try {
      final response =
          await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return data['bestMatches'] ?? [];
      } else {
        throw Exception(
            "Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch data");
    }
  }
}