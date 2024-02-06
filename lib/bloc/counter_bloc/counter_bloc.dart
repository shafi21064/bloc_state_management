
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_event.dart';
import 'package:learn_bloc/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{

  CounterBloc() : super(const CounterState()){
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event, Emitter<CounterState> emit){
    emit(state.copyWithCounter(counterValue: state.counterValue + 1));
  }

  void _decrement(DecrementEvent event, Emitter<CounterState> emit){
    emit(state.copyWithCounter(counterValue: state.counterValue -1));
  }
}