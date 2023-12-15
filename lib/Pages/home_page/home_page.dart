import 'package:flutter/material.dart';

import 'package:newsapp/Pages/news_page/news_page.dart';
import 'package:newsapp/Pages/save_page/save_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Notícias', style: TextStyle(fontSize: 40)),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.newspaper)),
            Tab(icon: Icon(Icons.favorite)),
          ]),
        ),
        body: const TabBarView(
          children: [
            NewsPage(),
            SavePage(),
          ],
        ),
      ),
    );
  }
}
