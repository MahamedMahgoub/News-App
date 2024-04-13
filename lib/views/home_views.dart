import 'package:flutter/material.dart';
import 'package:newsclouds/Widgets/news_list_view.dart';
import '../Widgets/categories_list_view.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 32),
              ),
              NewsTileListView(),
            ],
          )

          //  Column(
          //   children: const [
          //     CategoriesListView(),
          //     SizedBox(height: 32),
          //     Expanded(child: NewsTileListView()),
          //   ],
          // ),
          ),
    );
  }
}
