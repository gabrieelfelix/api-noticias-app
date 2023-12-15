import 'package:flutter/material.dart';
import 'package:newsapp/Pages/description_page/description_page.dart';
import 'package:newsapp/Provider/news_provider.dart';
import 'package:newsapp/Repository/local_news_repository.dart';
import 'package:newsapp/pages/home_page/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNewsRepository.createStorage();

  runApp(
    ChangeNotifierProvider(
      create: (_) => NewsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/desc': (context) => const DescriptionPage(),
      },
    );
  }
}
