import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_event.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return  Text(
                state.counterValue.toString(),
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),);
            }
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Text(
                    'Increment'
                  )),
              ElevatedButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Text(
                      'Decrement'
                  ))
            ],
          )
        ],
      ),
    );
  }
}
