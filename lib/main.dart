import 'package:flutter/material.dart';
import 'package:flutter_state_management/counter.dart';
import 'package:flutter_state_management/login_page.dart';
import 'package:flutter_state_management/provider_exercise.dart';
import 'package:flutter_state_management/splash.dart';
import 'package:flutter_state_management/user_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(
          create: (context) => Counter(0),
        ),
        ChangeNotifierProvider<UserRepository>(
          create: (context) => UserRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProviderExercise()));
              },
              child: Text("Provider Counter"),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProviderwithFirebaseAuth()));
              },
              child: Text("Login Page"),
            )
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
