import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable{
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

final class EnableOrDisableSwitch extends SwitchEvents{}

final class SliderChangeValue extends SwitchEvents{
  final double sliderValue;
  const SliderChangeValue({required this.sliderValue});
}