import 'package:flutter/material.dart';
import 'package:news_app/modals/news_model.dart';

class NewsBadgeWidget extends StatelessWidget {
  const NewsBadgeWidget({
    Key? key,
    required News news,
  })  : _news = news,
        super(key: key);

  final News _news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 12, top: 10),
      child: Text(_news.name,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText2!.merge(
                TextStyle(
                    color: Theme.of(context).primaryColor,
                    height: 1.4,
                    fontSize: 10),
              ),
          softWrap: false,
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}
