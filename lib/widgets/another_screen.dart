import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sm_scoped_model/model/app_state.dart';
import 'package:sm_scoped_model/model/counter_server_state.dart';

class AnotherScreen extends StatefulWidget {
  AnotherScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnotherScreenState createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  void _incrementCounter() {
    final container = Provider.of<AppState>(context);

    container.increment();
  }

  @override
  initState() {
    super.initState();
    new Future.delayed(Duration.zero, () {
      final counterServerState = Provider.of<CounterServerState>(context);
      counterServerState.loadDataAction();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final counterServerState = Provider.of<CounterServerState>(context);
    final counterGlobal = appState.counter;
    final counterServer = counterServerState.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loaded from the server:',
            ),
            counterServerState.loading
                ? CircularProgressIndicator()
                : Text(
                    '$counterServer',
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
