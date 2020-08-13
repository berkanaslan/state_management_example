import 'dart:async';

import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  @override
  _StreamExampleState createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {

  int _counter = 0;
  StreamController _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Exercise"),
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
              stream: _streamController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              },
            ),
            RaisedButton(
              onPressed:(){
                _streamController.add(++_counter);
              },
              child: Text("Increment", style: TextStyle(color: Colors.white),),
              color: Colors.green,
            ),
            RaisedButton(
              onPressed:(){
                _streamController.add(--_counter);
              },
              child: Text("Decrement", style: TextStyle(color: Colors.white),),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
