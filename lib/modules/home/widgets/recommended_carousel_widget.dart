import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modals/news_model.dart';
import 'package:provider/provider.dart';

import '../../../modals/news_api.dart';
import '../../news/view/news_detail.dart';
import '/modules/home/widgets/news_main_thumb_widget.dart';

class RecommendedCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsApi>(context).news;
    return SizedBox(
      height: 325,
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 18),
          primary: false,
          shrinkWrap: false,
          // physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) {
            News _story = newsData.elementAt(index);
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(NewsDetail.routeName, arguments: _story);
              },
              child: Container(
                width: 280,
                margin: EdgeInsetsDirectional.only(
                    end: 20, start: index == 0 ? 20 : 0, top: 20, bottom: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).focusColor.withOpacity(0.1),
                        blurRadius: 0.5,
                        offset: Offset(0, 1)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewsMainThumbWidget(news: _story),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                              DateFormat.yMMMd()
                                  .format(DateTime.parse(_story.publishedAt)),
                              style: Theme.of(context).textTheme.caption),
                          const SizedBox(height: 8),
                          Text(
                            _story.title,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyText1!,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person_pin,
                                size: 18,
                                color: Theme.of(context).focusColor,
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  _story.author,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
