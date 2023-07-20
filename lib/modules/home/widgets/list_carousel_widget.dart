import 'package:flutter/material.dart';
import 'package:news_app/modals/news_api.dart';
import 'package:provider/provider.dart';

import 'news_list_item_widget.dart';

class ListCarouselWidget extends StatelessWidget {
  ListCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsApi>(context).news;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      primary: false,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: ((_, index) {
        var _news = newsData.elementAt(10 + index);
        return NewsListItemWidget(news: _news);
      }),
    );
  }
}
