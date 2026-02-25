import 'package:bmtask/controller/stock_search_controller.dart';
import 'package:bmtask/services/watchlist_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class StockResultView extends StatelessWidget {
  final TextEditingController textController;

  const StockResultView({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<StockSearchController>();

    // 🔹 Case 1: Empty query + empty results
    if (textController.text.isEmpty &&
        controller.results.isEmpty &&
        !controller.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: Lottie.asset(
                'assets/animation/Empty.json',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Search for stocks to get started",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }

    // 🔹 Case 2: Query typed but no results
    if (textController.text.isNotEmpty &&
        controller.results.isEmpty &&
        !controller.isLoading) {
      return const Center(
        child: Text("No results found"),
      );
    }

    // 🔹 Case 3: Show results
    return ListView.builder(
      itemCount: controller.results.length,
      itemBuilder: (context, i) {
        final item = controller.results[i];
        final name = item['2. name'] ?? "N/A";
        final score = item['9. matchScore'] ?? "";

        return ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                score,
                style:
                    const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(
                Icons.add_circle_outline),
            onPressed: () {
              WatchlistService.addStock(
                name: name,
                score: score,
              );

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content:
                      Text("Added to Watchlist"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}