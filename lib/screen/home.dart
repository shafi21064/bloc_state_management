import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/internet_bloc/internet_bloc.dart';
import 'package:learn_bloc/bloc/internet_cubit/internet_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state){
            if(state == InternetState.Gained){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('connected'))
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No internet'))
              );
            }
          },
          builder: (context, state){
            if(state == InternetState.Gained){
              return const Text('Connceted');
            }else{
              return const Text('No internet');
            }
          },
        )
      )
    );
  }
}
