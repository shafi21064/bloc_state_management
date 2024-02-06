
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/slider_bloc/slider_event.dart';
import 'package:learn_bloc/bloc/slider_bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvents, SliderStates>{
  SliderBloc() : super(const SliderStates()){
    on<EnableDisableSwitchEvent>(_enableDisableSwitch);
    on<SliderValueEvent>(_changeSliderValue);
  }

  void _enableDisableSwitch(EnableDisableSwitchEvent event, Emitter<SliderStates> emit){
    emit(state.copyWith(isSwitchOn: !state.isSwitchOn));
  }

  void _changeSliderValue(SliderValueEvent event, Emitter<SliderStates> emit){
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}