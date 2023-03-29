part of 'item_bloc.dart';

abstract class ItemEvent {}

class GetItems extends ItemEvent {
  final String strToken;
  GetItems(this.strToken);
}

class CompleteItem extends ItemEvent {
  final ItemModel item;
  CompleteItem(this.item);
}

class EditItem extends ItemEvent {
  final ItemModel item;
  EditItem(this.item);
}

class CreateItem extends ItemEvent {
  final String strToken;
  final String strContent;
  final int idProject;
  CreateItem(this.strToken, this.strContent, this.idProject);
}

class UpdateItem extends ItemEvent {
  final String strToken;
  final String strContent;
  final bool isComplete;
  final int vIdItem;
  UpdateItem(this.strToken, this.strContent, this.isComplete, this.vIdItem);
}

class DeleteItem extends ItemEvent {
  final String strToken;
  final int vIdItem;
  DeleteItem(this.strToken, this.vIdItem);
}