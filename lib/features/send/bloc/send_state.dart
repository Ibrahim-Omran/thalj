part of 'send_bloc.dart';

@immutable
abstract class SendState {}

class SendInitial extends SendState {}
class SuccessSend extends SendState {}
class LoadingSend extends SendState {}
class FailedSend extends SendState {
  final String e;

  FailedSend(this.e);
}
