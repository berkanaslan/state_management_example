import 'package:flutter/material.dart';
import 'package:flutter_state_management/bloc/counter/counter_bloc.dart';
import 'package:flutter_state_management/bloc/counter/counter_event.dart';

class BlocExample extends StatefulWidget {
  @override
  _BlocExampleState createState() => _BlocExampleState();
}

class _BlocExampleState extends State<BlocExample> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Block Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              initialData: 0,
              stream: counterBloc.counter,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                counterBloc.counterEventSink.add(IncrementEvent());
              },
              child: Text(
                "Increment",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
            ),
            RaisedButton(
              onPressed: () {
                counterBloc.counterEventSink.add(DecrementEvent());
              },
              child: Text(
                "Decrement",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
