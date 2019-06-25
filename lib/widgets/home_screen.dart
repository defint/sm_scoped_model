import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sm_scoped_model/model/app_state.dart';
import 'package:sm_scoped_model/model/counter_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _incrementCounter() {
    final appState = Provider.of<AppState>(context);
    final counterState = Provider.of<CounterState>(context);

    appState.increment();
    counterState.increment();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final counterState = Provider.of<CounterState>(context);
    final counterGlobal = appState.counter;
    final counterLocal = counterState.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button (local):',
            ),
            Text(
              '$counterLocal',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(margin: EdgeInsets.only(top: 20.0)),
            Text(
              'You have pushed the button (global):',
            ),
            Text(
              '$counterGlobal',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(margin: EdgeInsets.only(top: 20.0)),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/another');
              },
              child: Text('Go to another screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
