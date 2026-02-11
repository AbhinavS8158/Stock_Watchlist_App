import 'package:bmtask/api/api.dart';
import 'package:bmtask/services/watchlist_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ValueNotifier<List> searchResults = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stock Search")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search e.g. TAT...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (query) async {
                final results = await SearchService().searchStocks(query);
                searchResults.value = results;
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List>(
              valueListenable: searchResults,
              builder: (context, list, _) {
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final name = list[i]['2. name'];
                    final score = list[i]['9. matchScore'];

                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            score,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          WatchlistService.addStock(
                            name: name,
                            score: score,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Added to Watchlist"),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}