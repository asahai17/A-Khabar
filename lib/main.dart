import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/modals/news_api.dart';
import '/modules/category/view/category_view.dart';
import 'modules/auth/provider/auth.dart';
import 'modules/auth/view/auth_screen.dart';
import 'modules/home/view/home_view.dart';
import 'modules/news/view/news_detail.dart';
import 'modules/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
          ChangeNotifierProvider(
            create: (context) => NewsApi(),
          ),
        ],
        child: Consumer<Auth>(
          // ignore: missing_return
          builder: (context, auth, _) => MaterialApp(
            title: 'A - Khabar',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // primarySwatch: Colors.blueGrey,
              primaryColor: Colors.white,
              shadowColor: Colors.grey[50],
            ),
            home: auth.isAuth
                ? HomeView()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshorts) =>
                        authResultSnapshorts.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : authResultSnapshorts.data == false
                                ? AuthScreen()
                                : HomeView(),
                  ),
            routes: {
              // productsOverviewScreen(),
              NewsDetail.routeName: (context) => NewsDetail(),
              CategoryScreen.routeName: (context) => CategoryScreen(),
            },
          ),
        ));
  }
}
