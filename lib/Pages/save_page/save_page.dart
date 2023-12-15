import 'package:flutter/material.dart';
import 'package:newsapp/Provider/news_provider.dart';
import 'package:newsapp/pages/news_page/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, np, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
          child: ListView.builder(
              itemCount: np.listSaved.length,
              itemBuilder: (context, index) {
                return NewsTile(
                  index: index,
                  list: np.listSaved,
                  isTap: false,
                );
              }),
        ),
      ),
    );
  }
}
