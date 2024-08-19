import 'package:bloc_first/bloc/switch/switch_bloc.dart';
import 'package:bloc_first/bloc/switch/switch_event.dart';
import 'package:bloc_first/bloc/switch/switch_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';


class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Bloc'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (prev, current) => prev.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return CupertinoSwitch(
                        value: state.isSwitch,
                        onChanged: (value) {
                          context.read<SwitchBloc>().add(
                              EnableOrDisableSwitch());
                        });
                  },
                )
              ],
            ),
            const Gap(20),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 150,
                  width: MediaQuery
                      .sizeOf(context)
                      .width,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            const Gap(20),

            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (prev, current) => prev.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                    value: state.sliderValue,
                    onChanged: (value) {
                      context.read<SwitchBloc>().add(SliderChangeValue(sliderValue: value));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

