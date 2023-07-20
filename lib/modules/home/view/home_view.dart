import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '/modals/news_api.dart';
import '../../category/view/category_view.dart';
import '../widgets/categories_carousel_widget.dart';
import '../widgets/list_carousel_widget.dart';
import '../widgets/recommended_carousel_widget.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<NewsApi>(context).fetchAndSetNews("Trending").then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsApi>(context).news;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
          icon: Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => {
            _scaffoldKey.currentState!.openDrawer()
          }, //Scaffold.of(context).openDrawer()
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
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : newsData.isEmpty
              ? const Center(
                  child: Text('NO News Available'),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    await Provider.of<NewsApi>(context)
                        .fetchAndSetNews("Trending")
                        .then((_) {
                      setState(() {});
                    });
                  },
                  child: CustomScrollView(
                    primary: true,
                    shrinkWrap: false,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Wrap(
                          children: [
                            Container(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text("Bulletin",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall)),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(CategoryScreen.routeName);
                                    },
                                    shape: const StadiumBorder(),
                                    elevation: 0,
                                    child: Text("See More",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            RecommendedCarouselWidget(),
                            Container(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text("Latest Explores",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall)),
                                  // MaterialButton(
                                  //   onPressed: () {
                                  //     Navigator.of(context)
                                  //         .pushNamed(CategoryScreen.routeName);
                                  //   },
                                  //   shape: const StadiumBorder(),
                                  //   elevation: 0,
                                  //   child: Text("See More",
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .caption),
                                  // ),
                                ],
                              ),
                            ),
                            CategoriesCarouselWidget(),
                            ListCarouselWidget(),
                          ],
                        ),
                      ),
                    ],
                  )),
    );
  }
}
