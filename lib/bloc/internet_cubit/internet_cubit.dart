import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState{Initial, Gained, Lost}

class InternetCubit extends Cubit<InternetState>{

  Connectivity _conectivity = Connectivity();
  StreamSubscription? connectivityStream;

  InternetCubit() : super(InternetState.Initial){

    _conectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        emit(InternetState.Gained);
      }else{
        emit(InternetState.Lost);
      }
    });
  }
  @override
  Future<void> close() {
    connectivityStream?.cancel();
    return super.close();
  }
}