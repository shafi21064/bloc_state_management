
import 'package:equatable/equatable.dart';

class SliderStates extends Equatable{

  final bool isSwitchOn;
  final double sliderValue;

  const SliderStates({
    this.isSwitchOn = false,
    this.sliderValue = 0.0
  });

  SliderStates copyWith({bool? isSwitchOn, double? sliderValue}){
    return SliderStates(
        isSwitchOn: isSwitchOn ?? this.isSwitchOn,
      sliderValue: sliderValue ?? this.sliderValue
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [isSwitchOn, sliderValue];

}