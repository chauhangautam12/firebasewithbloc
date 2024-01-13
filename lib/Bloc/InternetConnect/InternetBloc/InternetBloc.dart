import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebaserelateed/Bloc/InternetConnect/Event/InternetEvent.dart';
import 'package:firebaserelateed/Bloc/InternetConnect/State/InternetState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity connectivity=Connectivity();
  StreamSubscription? connectyvitySub;
  InternetBloc():super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));
   connectyvitySub= connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile ||result==ConnectivityResult.wifi){
        add(InternetGainEvent());
      }
      else{
        add(InternetLostEvent());
      }
    });

  }
@override
  Future<void>close() {
    connectyvitySub?.cancel();
    return super.close();
}
}