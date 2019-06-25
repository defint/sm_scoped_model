import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class CounterServerState with ChangeNotifier {
  final Dio _client = new Dio();

  bool _loading = false;
  int _counter = 0;

  bool get loading => _loading;
  int get counter => _counter;

  setLoadingAction(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  setCounterAction(int newValue) {
    _counter = newValue;
    notifyListeners();
  }

  loadDataAction() async {
    setLoadingAction(true);

    Response response = await _client.get(
        'https://www.random.org/integers/?num=1&min=1&max=100&col=1&base=10&format=plain&rnd=new');

    _counter = int.parse(response.data);
    _loading = false;

    notifyListeners();
  }
}
