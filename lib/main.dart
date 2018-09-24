import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/router.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/opening.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/reducers.dart';
import 'redux/middleware.dart';

void main() => runApp(new TontApp());

class TontApp extends StatelessWidget {
  final store = new Store(appStateReducers,
      initialState: AppState.empty, middleware: [appMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Tont App',
        theme: new ThemeData(
            ),
        routes: Router.getRoutes(),
        home: StoreBuilder<AppState>(
            builder: (context, store) => new Opening()
        ),
      ),
    );
  }
}
