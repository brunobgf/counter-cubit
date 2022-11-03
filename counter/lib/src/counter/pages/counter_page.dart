import 'package:counter/src/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late CounterCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = CounterCubit();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white38.withOpacity(0.8),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          bloc: _cubit,
          builder: (context, state) {
            return Text('$state', style: textTheme.headline2);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterPage_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            backgroundColor: Color.fromARGB(255, 39, 188, 44),
            onPressed: () => _cubit.increment(),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            key: const Key('counterPage_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            backgroundColor: Color.fromARGB(255, 211, 33, 21),
            onPressed: () => _cubit.decrement(),
          ),
        ],
      ),
    );
  }
}
