import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modals/news_api.dart';
import '../../home/widgets/news_list_item_widget.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category-news';

  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsApi>(context).news;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A - Khabar",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).hintColor),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications,
                  color: Theme.of(context).hintColor)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Theme.of(context).hintColor)),
          IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.person_sharp, color: Theme.of(context).hintColor))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        primary: false,
        shrinkWrap: true,
        itemCount: newsData.length,
        itemBuilder: ((_, index) {
          var _news = newsData.elementAt(20 + index);
          return NewsListItemWidget(news: _news);
        }),
      ),
    );
  }
}
