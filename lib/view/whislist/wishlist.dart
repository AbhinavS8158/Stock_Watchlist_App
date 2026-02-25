import 'package:bmtask/constant.dart';
import 'package:bmtask/model/watchlist_model.dart';
import 'package:bmtask/services/watchlist_service.dart';
import 'package:bmtask/view/homescreen/widget/appbar.dart';
import 'package:bmtask/view/whislist/widget/wishlist_header.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppbar("wishlist"),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColor.blueGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child:const WatchlistHeader(),
            ),

            const SizedBox(height: 10),

            // Hive Data
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box<WatchlistModel>(
                  'watchlist',
                ).listenable(),
                builder: (context, Box<WatchlistModel> box, _) {
                  if (box.isEmpty) {
                    return const Center(child: Text('No data added'));
                  }

                  final items = box.values.toList();

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),

                              Expanded(
                                child: Text(
                                  item.score,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColor.grey,
                                ),
                                onPressed: () async {
                                  final shouldDelete = await showDialog<bool>(
                                    context: context,
                                    builder: (dialogContext) => AlertDialog(
                                      title: const Text('Delete Item'),
                                      content: const Text(
                                        'Are you sure you want to delete this item?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                            dialogContext,
                                            false,
                                          ),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                            dialogContext,
                                            true,
                                          ),
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (shouldDelete == true) {
                                    WatchlistService.deleteByIndex(index);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
