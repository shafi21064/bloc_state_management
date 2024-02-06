
import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counterValue;
  const CounterState({
    this.counterValue = 0
});

  CounterState copyWithCounter({int? counterValue}){
    return CounterState(
      counterValue: counterValue ?? this.counterValue
    );
}
  @override
  // TODO: implement props
  List<Object?> get props => [counterValue];

}