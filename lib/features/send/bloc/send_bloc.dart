import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/features/send/data/remote_data_source.dart';

import '../../../core/network/ErrorModel.dart';
import '../../../core/utils/toast.dart';

part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendInitial()) {
    on<SendEvent>((event, emit) {
      if(event is SendSubmitted)
        {
          emit(LoadingSend());
          try{
            SendData().send(name: event.name, price: event.price, phone: event.phone);
            emit(SuccessSend());
          }catch(e){
            emit(FailedSend(e.toString()));
          }
        }
    });
  }
}
