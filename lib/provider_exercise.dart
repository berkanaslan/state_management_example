import 'package:flutter/material.dart';
import 'package:flutter_state_management/counter.dart';
import 'package:provider/provider.dart';

class ProviderExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. Yöntem:
    final myCounter = Provider.of<Counter>(context);

    // 2. Yöntem:

    return Consumer(
      builder: (context, Counter myCounter2, child) => Scaffold(
        appBar: AppBar(
          title: Text("Proivder Exercise"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${myCounter.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
              RaisedButton(
                onPressed: myCounter2.increment,
                child: Text("Increment", style: TextStyle(color: Colors.white),),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: myCounter2.decrement,
                child: Text("Decrement", style: TextStyle(color: Colors.white),),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
