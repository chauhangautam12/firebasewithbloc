import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum internetState {Intialition,Lost,Gain}
class InternetCubit extends Cubit<internetState>{
  Connectivity connectivity=Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit():super(internetState.Intialition){
    connectivitySubscription=connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile||result==ConnectivityResult.wifi){
        emit(internetState.Gain);
      }
      else{
        emit(internetState.Lost);
      }
    });
  }
@override
  Future<void> close() {
   connectivitySubscription?.cancel();
    return super.close();
  }

}