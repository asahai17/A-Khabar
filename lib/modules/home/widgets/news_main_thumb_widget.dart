import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/modules/home/widgets/salon_level_badge_widget.dart';
import '/modals/news_model.dart';

class NewsMainThumbWidget extends StatelessWidget {
  const NewsMainThumbWidget({
    required News news,
  }) : _news = news;

  final News _news;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: _news.id,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CachedNetworkImage(
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: _news.urlToImage,
                placeholder: (context, url) => Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error_outline),
              ),
            ),
          ),
        ),
        NewsBadgeWidget(news: _news),
      ],
    );
  }
}
