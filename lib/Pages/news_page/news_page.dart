import 'package:flutter/material.dart';
import 'package:newsapp/Provider/news_provider.dart';
import 'package:newsapp/pages/news_page/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _HomepageState();
}

class _HomepageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, np, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
            child: np.isLoaded
                ? ListView.builder(
                    itemCount: np.listNotice.length,
                    itemBuilder: (BuildContext context, index) => NewsTile(
                        index: index, list: np.listNotice, isTap: true),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
