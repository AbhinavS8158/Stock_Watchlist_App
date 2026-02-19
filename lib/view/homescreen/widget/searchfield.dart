import 'package:bmtask/api/api.dart';
import 'package:bmtask/constant.dart';
import 'package:flutter/material.dart';

class StockSearchField extends StatelessWidget {
  final ValueNotifier<List> searchResults;

  const StockSearchField({
    super.key,
    required this.searchResults,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: AppColor.black,
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: TextField(
          decoration: const InputDecoration(
            hintText: "Search stocks (e.g. TATA, INFY)",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: 16),
          ),
          onChanged: (query) async {
            if (query.isEmpty) {
              searchResults.value = [];
              return;
            }

            final results =
                await SearchService().searchStocks(query);
            searchResults.value = results;
          },
        ),
      ),
    );
  }
}
