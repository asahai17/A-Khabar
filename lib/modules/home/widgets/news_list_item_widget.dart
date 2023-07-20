import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../news/view/news_detail.dart';
import '/modals/news_model.dart';

class NewsListItemWidget extends StatelessWidget {
  const NewsListItemWidget({
    Key? key,
    required News news,
  })  : _news = news,
        super(key: key);

  final News _news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(NewsDetail.routeName, arguments: _news);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).focusColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
          border:
              Border.all(color: Theme.of(context).focusColor.withOpacity(0.05)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Wrap(
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(_news.name,
                            style: Theme.of(context).textTheme.caption),
                      ),
                      Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(_news.publishedAt)),
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(
                        _news.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 3,
                        // textAlign: TextAlign.end,
                      ),
                    ],
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
                          _news.author,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            Column(
              children: [
                Hero(
                  tag: _news.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      imageUrl: _news.urlToImage,
                      placeholder: (context, url) => Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 100,
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error_outline),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
