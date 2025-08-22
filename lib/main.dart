import 'package:bloc_demo/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Welcome demo bloc')),
        body: Center(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, count) {
              return Text("Count: $count", style: TextStyle(fontSize: 30));
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => counterBloc.add(Increment()),
              child: Icon(Icons.add),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => counterBloc.add(Decrement()),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
