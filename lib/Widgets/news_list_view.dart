import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsclouds/models/artic_model.dart';
import 'package:newsclouds/services/news_services.dart';

import 'news_tile.dart';

class NewsTileListView extends StatefulWidget {
  const NewsTileListView({super.key});

  @override
  State<NewsTileListView> createState() => _NewsTileListViewState();
}

class _NewsTileListViewState extends State<NewsTileListView> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsServices(Dio()).getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return NewsTile(
            articleModel: articles[index],
          );
        },
      ),
    );
  }
}
