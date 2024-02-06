import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/slider_bloc/slider_bloc.dart';
import 'package:learn_bloc/bloc/slider_bloc/slider_event.dart';
import 'package:learn_bloc/bloc/slider_bloc/slider_state.dart';

class SwitchSlider extends StatelessWidget {
  const SwitchSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification", style: TextStyle(fontSize: 20),),
                BlocBuilder<SliderBloc, SliderStates>(
                  buildWhen: (previous, current) => previous.isSwitchOn != current.isSwitchOn,
                  builder: (context, state) {
                    return CupertinoSwitch(
                        value: state.isSwitchOn,
                        onChanged: (value) {
                          context.read<SliderBloc>().add(EnableDisableSwitchEvent());
                        });
                  },
                )
              ],
            ),
            const SizedBox(height: 10,),
            BlocBuilder<SliderBloc, SliderStates>(
              buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 250,
                      color: Colors.red.withOpacity(state.sliderValue),
                    ),
                    const SizedBox(height: 10,),
                    CupertinoSlider(
                        value: state.sliderValue,
                        onChanged: (value) {
                          context.read<SliderBloc>().add(SliderValueEvent(sliderValue: value));
                        }),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
