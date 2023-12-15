import 'package:flutter/material.dart';
import 'package:newsapp/models/news_models.dart';

class NewsTile extends StatelessWidget {
  List<NewsModel> list = [];
  bool isTap = true;
  int index = 0;
  NewsTile(
      {Key? key, required this.index, required this.list, required this.isTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/desc',
            arguments: {'index': index, 'model': list[index], 'isTap': isTap});
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Hero(
              tag: 'news-image$index',
              child: Image.network(list[index].urlToImage, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                return const SizedBox(height: 2);
              }, loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const CircularProgressIndicator();
                }
              }),
            ),
            const SizedBox(height: 15),
            Text(list[index].title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 15),
            Text(
              '${list[index].author} • ${list[index].publishedAt.toString().substring(0, 9)}',
            ),
          ],
        ),
      ),
    );
  }
}
