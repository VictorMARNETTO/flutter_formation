import 'package:bloc_demo/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('AppBar'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter: $state'),
                OutlinedButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: Icon(Icons.add),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
