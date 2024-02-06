
import 'package:equatable/equatable.dart';

class SliderEvents extends Equatable{

  const SliderEvents();

  @override
  List<Object> get props => [];

}

class EnableDisableSwitchEvent extends SliderEvents{}

class SliderValueEvent extends SliderEvents{
  final double sliderValue;
  const SliderValueEvent({required this.sliderValue});

}