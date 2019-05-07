import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/router.dart';
import 'package:peddi_tont_app/ui/screens/menu/menu_app.dart';
import 'package:peddi_tont_app/ui/screens/menu/widgets/menu_category.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/opening.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/reducers.dart';
import 'redux/middleware.dart';

void main() => runApp(new TontApp());

class TontApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TontAppRoot();
}

class TontAppRoot extends StatefulWidget {
  @override
  TontAppRootState createState() => TontAppRootState();
}

class TontAppRootState extends State<TontAppRoot> {
  //variable to verify time of inactivity
  Timer _timer;

  final store = new Store(appStateReducers,
      initialState: AppState.empty, middleware: [appMiddleware]);

  @override
  void initState() {
    super.initState();

    _initializeTimer();
  }

//  void _logOutUser() {
//    // Log out the user if they're logged in, then cancel the timer.
//    // You'll have to make sure to cancel the timer if the user manually logs out
//    //   and to call _initializeTimer once the user logs in
//    _goToAdvertising();
//    _timer.cancel();
//  }

  // You'll probably want to wrap this function in a debounce
  void _handleUserInteraction([_]) {
//    if (!store.state.timerActive) {
//      // This means the login has not been made
//      return;
//    }

    _restartTimer();
  }

  void _initializeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (store.state.timerActive)
        _goToAdvertising();
      else
        _restartTimer();
    });
  }

  void _restartTimer() {
    _timer.cancel();
    _initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleUserInteraction,
        onPanDown: _handleUserInteraction,
        onScaleStart: _handleUserInteraction,
        // ... repeat this for all gesture events
        child: StoreProvider<AppState>(
          store: store,
          child: new MaterialApp(
            title: 'Tont App',
            theme: new ThemeData(),
            routes: Router.getRoutes(),
            home: StoreBuilder<AppState>(
                builder: (context, store) => new Opening()),
          ),
        )
        // ... from here it's just your normal app,
        // Remember that any GestureDetector within your app must have
        //   HitTestBehavior.translucent
        );
  }

  _goToAdvertising() {
    Navigator.push(
        store.state.context,
        MaterialPageRoute(
            builder: (context) => MenuApp(fromInactivityTimer: true)));
    _timer.cancel();
  }
}
