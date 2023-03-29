import 'package:flutter_app_diptsv3_todo/models/item_model.dart';

class ItemDTO {
  String strMessage;
  bool success;
  List<ItemModel> oResponse;

  ItemDTO({
    required this.strMessage,
    required this.success,
    required this.oResponse
  });
}