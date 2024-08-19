import 'package:bloc/bloc.dart';
import 'package:bloc_first/bloc/switch/switch_event.dart';
import 'package:bloc_first/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState>{
  SwitchBloc() : super(const SwitchState()){
    on<EnableOrDisableSwitch>(_enableOrDisableSwitch);
    on<SliderChangeValue>(_changeSliderValue);
  }

  void _enableOrDisableSwitch(EnableOrDisableSwitch event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _changeSliderValue(SliderChangeValue event, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}