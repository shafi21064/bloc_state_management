import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc/internet_bloc/internet_bloc.dart';
import 'package:learn_bloc/bloc/internet_cubit/internet_cubit.dart';
import 'package:learn_bloc/bloc/slider_bloc/slider_bloc.dart';
import 'package:learn_bloc/screen/counter_screen.dart';
import 'package:learn_bloc/screen/home.dart';

import 'screen/switch_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SliderBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SwitchSlider(),
      ),
    );
  }
}

