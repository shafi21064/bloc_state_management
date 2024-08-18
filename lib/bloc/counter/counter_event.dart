
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{
  const CounterEvent();

  @override
  List<Object> get props => [];
}

final class IncrementCounter extends CounterEvent{}
final class DecrementCounter extends CounterEvent{}
final class ResetCounter extends CounterEvent{}