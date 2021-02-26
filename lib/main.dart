import 'package:win32/win32.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _hwnd = 0;

  @override
  void initState() {
    _hwnd = FindWindowEx(
        0, 0, TEXT('FLUTTER_RUNNER_WIN32_WINDOW'), TEXT('win32_movewindow'));
    if (_hwnd != 0) {
      print('FindWindowEx success');
    } else {
      print('FindWindowEx failed');
    }

    super.initState();
  }

  void onBtnMoveWIndow() {
    if (_hwnd != 0) {
      MoveWindow(_hwnd, 100, 100, 200, 200, 1);
    } else {
      print('_hwnd == 0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
                onPressed: onBtnMoveWIndow, child: Text('MoveWindow')),
          ],
        ),
      ),
    );
  }
}
