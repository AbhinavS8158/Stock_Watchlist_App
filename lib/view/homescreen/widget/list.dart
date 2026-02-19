import 'package:bmtask/constant.dart';
import 'package:bmtask/view/homescreen/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StockResultList extends StatelessWidget {
  final ValueNotifier<List> searchResults;

  const StockResultList({
    super.key,
    required this.searchResults,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List>(
      valueListenable: searchResults,
      builder: (context, list, _) {
        if (list.isEmpty) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child:Lottie.asset(
                  'assets/animation/Empty.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Text("Search for stocks to see results",
                  style: TextStyle(color: AppColor.grey))
            ],
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: list.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final name = list[i]['2. name'];
            final score = list[i]['9. matchScore'];

            buildListTile(name, score);
          },
        );
      },
    );
  }
}
