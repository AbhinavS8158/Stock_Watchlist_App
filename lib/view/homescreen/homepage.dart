import 'package:bmtask/controller/stock_search_controller.dart';
import 'package:bmtask/view/homescreen/widget/appbar.dart';
import 'package:bmtask/view/homescreen/widget/build_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StockSearchController(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<StockSearchController>();

    return Scaffold(
      appBar: buildAppbar("Stock Search"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Search e.g. TAT...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: controller.isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : null,
              ),
              onChanged: controller.search,
            ),
          ),
          Expanded(
            child: StockResultView(
              textController: _textController,
            ),
          )
        ],
      ),
    );
  }

 
}
