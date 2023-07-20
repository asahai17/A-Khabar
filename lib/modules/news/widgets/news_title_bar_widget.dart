import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../modals/news_model.dart';

class NewsTitleBarWidget extends StatelessWidget implements PreferredSize {
  final BuildContext context;
  final News news;
  const NewsTitleBarWidget(
      {Key? key, required this.context, required this.news})
      : super(key: key);

  Widget buildTitleBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 250,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_pin,
                size: 18,
                color: Theme.of(context).focusColor,
              ),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  news.author,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: Center(
              child: Text(
                news.title,
                style: Theme.of(context).textTheme.headline6,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child:
                    Text(news.name, style: Theme.of(context).textTheme.caption),
              ),
              Text(DateFormat.yMMMd().format(DateTime.parse(news.publishedAt)),
                  style: Theme.of(context).textTheme.caption),
            ],
          ),
          SizedBox(height: 5),
          // Container(
          //     child: Text(
          //   news.description,
          //   style: Theme.of(context).textTheme.bodyLarge,
          // )),
          // Container(child: Text(news.content))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTitleBar();
  }

  @override
  Widget get child => buildTitleBar();

  @override
  Size get preferredSize => new Size(MediaQuery.of(context).size.width, 110);
}
