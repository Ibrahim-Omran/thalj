

import 'package:flutter/cupertino.dart';




@immutable
abstract class GetOrdersDataEvent {}

class GetOrdersData extends GetOrdersDataEvent {

}


class GetOneOrdersData extends GetOrdersDataEvent {
  final String id;

  GetOneOrdersData(this.id);
}