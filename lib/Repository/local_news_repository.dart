import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

//Save news using Hive
class LocalNewsRepository {
  static var box;
  static String nameBox = 'fav';
  //Create box hive
  static Future<void> createStorage() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = documentsDirectory.path;
    Hive.init(path);
    await Hive.openBox(nameBox);
    box = Hive.box(nameBox);
  }

  //Function to save news.
  static void saveNews(var model, int index) async {
    await box.put(index.toString(), {
      'author': model.author,
      'title': model.title,
      'description': model.description,
      'urlToImage': model.urlToImage,
      'publishedAt': model.publishedAt,
      'content': model.content,
      'fav': true,
    });
  }

  //Function to delete news
  static void deleteNews(int index) {
    box.delete(index.toString());
  }
}
