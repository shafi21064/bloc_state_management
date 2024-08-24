import 'dart:io';

import 'package:bloc_first/bloc/img_picker/img_picker_bloc.dart';
import 'package:bloc_first/bloc/img_picker/img_picker_event.dart';
import 'package:bloc_first/bloc/img_picker/img_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImgPickerScreen extends StatelessWidget {
  const ImgPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Img Bloc'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<ImgPickerBloc, ImgPickerState>(
                    buildWhen: (prev, current) => prev.captureFromCamera != current.captureFromCamera,
                    builder: (context, state) {
                      print('build 1 ');
                      return Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: state.captureFromCamera != null
                            ? Image.file(
                            File(state.captureFromCamera!.path.toString()))
                            : const SizedBox(),
                      );
                    },
                  ),
                  BlocBuilder<ImgPickerBloc, ImgPickerState>(

                    buildWhen: (prev, current) => prev.pickedFromGallery != current.pickedFromGallery,
                    builder: (context, state) {
                      print('build 2 ');
                      return Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: state.pickedFromGallery != null
                            ? Image.file(
                            File(state.pickedFromGallery!.path.toString()))
                            : const SizedBox(),
                      );
                    },
                  ),
                ],
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<ImgPickerBloc>().add(CameraCapture());
                    },
                    icon: const Icon(
                      Icons.camera,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ImgPickerBloc>().add(GalleryPicker());
                    },
                    icon: const Icon(
                      Icons.photo,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
