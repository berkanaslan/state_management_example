import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/flutter_bloc/counter_event.dart';
import 'package:flutter_state_management/flutter_bloc/counter_flutter_bloc.dart';
import 'package:flutter_state_management/flutter_bloc/counter_state.dart';

class FlutterBlockPackage extends StatefulWidget {
  @override
  _FlutterBlockPackageState createState() => _FlutterBlockPackageState();
}

class _FlutterBlockPackageState extends State<FlutterBlockPackage> {
  final _myCounterBloc = FlutterBloc(CounterState.initial());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlutterBloc>(
      create: (BuildContext context) => _myCounterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("flutter_bloc Example"),
        ),
        body: myBodyWidget(),
      ),
    );
  }

  @override
  void dispose() {
    _myCounterBloc.close();
    super.dispose();
  }
}

class myBodyWidget extends StatelessWidget {
  const myBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: myColumnWidget(),
    );
  }
}

class myColumnWidget extends StatelessWidget {
  const myColumnWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<FlutterBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        BlocBuilder(
          cubit: _bloc,
          builder: (context, CounterState state) {
            return Text(
              '${state.number.toString()}',
              style: Theme.of(context).textTheme.headline4,
            );
          },
        ),
        RaisedButton(
          onPressed: () {
            _bloc.add(CounterIncrement());
          },
          child: Text(
            "Increment",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
        ),
        RaisedButton(
          onPressed: () {
            _bloc.add(CounterDecrement());
          },
          child: Text(
            "Decrement",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
        )
      ],
    );
  }
}
