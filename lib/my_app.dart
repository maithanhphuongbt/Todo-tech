import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'core/redux/store.dart';
import 'core/router/router.dart';
import 'core/util/util.dart';

class MyApp extends StatefulWidget {
  final String launchScreen;

  const MyApp({Key key, this.launchScreen}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: Redux.store,
      child: MaterialApp(
        onGenerateRoute: Router.generateRoute,
        navigatorKey: navigatorKey,
        initialRoute: Router.home,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
