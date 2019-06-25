import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sm_scoped_model/model/app_state.dart';
import 'package:sm_scoped_model/model/counter_server_state.dart';
import 'package:sm_scoped_model/model/counter_state.dart';
import 'package:sm_scoped_model/widgets/another_screen.dart';

import 'widgets/home_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => AppState()),
        ],
        child: SmScopedModelApp(),
      ),
    );

class SmScopedModelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SM Native',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
          buttonColor: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider(
            builder: (context) => CounterState(),
            child: HomeScreen(title: 'Local + Global')),
        '/another': (context) => ChangeNotifierProvider(
            builder: (context) => CounterServerState(),
            child: AnotherScreen(title: 'Local + Async')),
      },
    );
  }
}
