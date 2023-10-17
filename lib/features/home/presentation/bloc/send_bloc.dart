




import 'package:bloc/bloc.dart';
import 'package:thalj/features/home/presentation/bloc/send_event.dart';
import 'package:thalj/features/home/presentation/bloc/send_state.dart';


class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendInitial()) {
    on<SendEvent>((event, emit) {
      if(event is SendSubmitted)
        {
          emit(LoadingSend());
          try{

            emit(SuccessSend());
          }catch(e){
            emit(FailedSend(e.toString()));
          }
        }
    });
  }
}
