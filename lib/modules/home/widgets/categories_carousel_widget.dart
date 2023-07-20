import 'package:flutter/material.dart';
import 'package:news_app/modals/news_api.dart';
import 'category_grid_item_widget.dart';

class CategoriesCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      padding: EdgeInsets.only(bottom: 15),
      child: GridView.count(
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 4 : 6,
        children: NewsApi()
            .categories
            .map((element) =>
                CategoryGridItemWidget(category: element, heroTag: "heroTag"))
            .toList(),
      ),
    );
  }
}
