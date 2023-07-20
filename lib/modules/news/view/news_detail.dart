import 'package:flutter/material.dart';

import '../../../modals/news_model.dart';
import '../widgets/news_title_bar_widget.dart';

class NewsDetail extends StatelessWidget {
  static const routeName = '/news-detail';

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: Column(children: [
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    height: 350,
                  ),
                  Positioned.fill(
                      child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Image.network(
                      news.urlToImage,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ]),
            expandedHeight: 360, // MediaQuery.of(context).size.height,
            elevation: 0,
            primary: true,
            floating: true,
            iconTheme: IconThemeData(color: Theme.of(context).hintColor),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                    blurRadius: 20,
                  ),
                ]),
                child: Icon(Icons.arrow_back_ios,
                    color: Theme.of(context).hintColor),
              ),
              onPressed: () => {Navigator.pop(context)},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.link),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
            bottom: NewsTitleBarWidget(context: context, news: news),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).focusColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5)),
                ],
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Text(
                    news.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(news.content),
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
