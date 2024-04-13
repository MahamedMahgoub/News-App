import 'package:dio/dio.dart';
import 'package:newsclouds/models/artic_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews() async {
    Response response = await dio.get(
        'https://newsdata.io/api/1/news?apikey=pub_41954ad6fd97eed5aaa0c87d2078bba28e921&language=ar');

    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['results'];

    List<ArticleModel> articleList = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        image: article['image_url'],
        title: article['title'],
        subTitle: article['description'],
      );
      articleList.add(articleModel);
    }
    return articleList;
  }
}
