import 'package:bloc_first/bloc/counter/counter_bloc.dart';
import 'package:bloc_first/bloc/counter/counter_state.dart';
import 'package:bloc_first/bloc/img_picker/img_picker_bloc.dart';
import 'package:bloc_first/bloc/switch/switch_bloc.dart';
import 'package:bloc_first/ui/img_picker/img_picker.dart';
import 'package:bloc_first/ui/slider/slider.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(const CounterState()),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImgPickerBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImgPickerScreen(),
      ),
    );
  }
}


