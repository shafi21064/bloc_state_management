import 'package:bloc_first/bloc/counter/counter_bloc.dart';
import 'package:bloc_first/bloc/counter/counter_event.dart';
import 'package:bloc_first/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter bloc'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style:
                    const TextStyle(fontSize: 68, fontWeight: FontWeight.w400),
              );
            },
          ),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text('Increment')),
              const Gap(30),
              ElevatedButton(onPressed: () {
                context.read<CounterBloc>().add(DecrementCounter());
              }, child: const Text('Decrement'))
            ],
          ),
          const Gap(30),
          ElevatedButton(onPressed: () {
            context.read<CounterBloc>().add(ResetCounter());
          }, child: const Text('Reset'))
        ],
      ),
    );
  }
}
