part of 'item_bloc.dart';

abstract class ItemState {

  final bool isActive;
  final bool isCompleted;
  final bool canEdit;
  final ItemModel? item;
  final List<ItemModel>? lstItems;

  const ItemState({
    this.isActive = false,
    this.isCompleted = false,
    this.canEdit = false,
    this.item,
    this.lstItems
  });
}

class ItemInitialState extends ItemState {
  ItemInitialState(): super(
    isActive: false,
    isCompleted: false,
    canEdit: false,
    item: ItemModel(
      id: 0, 
      content: "",
      itemType: 0,
      checked: false,
      projectId: 0,
      priority: 0),
    lstItems: []
  );
}

class ItemSetState extends ItemState {
  final bool status;
  final List<ItemModel> newLstItem;
  const ItemSetState(this.status, this.newLstItem)
  :super (isActive: status, lstItems: newLstItem);
}

class ItemCompleted extends ItemState {
  final bool completed;
  final ItemModel itemElement;
  const ItemCompleted(this.completed, this.itemElement)
  :super (isCompleted: completed, canEdit: !completed, item: itemElement);
}

class ItemCanEdit extends ItemState {
  final bool editing;
  final ItemModel itemElement;
  const ItemCanEdit(this.editing, this.itemElement)
  :super (isCompleted: !editing, canEdit: editing, item: itemElement);
}