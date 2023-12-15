import 'package:flutter/material.dart';
import 'package:newsapp/Provider/news_provider.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({
    super.key,
  });

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  int index = -1;
  var model;
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    if (data.containsKey('index')) {
      index = data['index'] as int;
      model = data['model'];
      isTap = data['isTap'];
    }
    return Consumer<NewsProvider>(
      builder: (contex, np, child) => Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (isTap == false) {
                  np.removeNews(index);
                  Navigator.pop(context);
                } else {
                  model.fav = !model.fav;
                  if (model.fav) {
                    np.saveNews(model, index);
                  } else {
                    np.removeNews(index);
                  }
                }
              });
            },
            icon: isTap
                ? (model.fav
                    ? Icon(Icons.favorite, color: Colors.red[300])
                    : const Icon(Icons.favorite_outline))
                : const Icon(Icons.delete_rounded),
          ),
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(model.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10),
                Hero(
                  tag: 'news-image$index',
                  child: Image.network(model.urlToImage, fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(height: 2);
                  }),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                const SizedBox(height: 15),
                Text(model.description),
                Text(model.content),
                const SizedBox(height: 20),
                Text(
                  '${model.author} • ${model.publishedAt.toString().substring(0, 9)}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
