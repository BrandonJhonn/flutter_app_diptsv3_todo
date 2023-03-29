// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/item_model.dart';
import '../../models/item_dto.dart';
import '../../services/item_service.dart';
import '../../views/widgets/toast_widget.dart' as alert;

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemService wsItem = ItemService();

  ItemBloc(): super(ItemInitialState()) {

    on<GetItems>((event, emit) async {

      ItemDTO responseDTO = await wsItem.getItems(event.strToken)
                                        .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Carga Correcta", true);
        emit(ItemSetState(true, responseDTO.oResponse));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);

    });

    on<EditItem>((event, emit) {
      if (state.isActive) {
        emit(ItemCanEdit(true, event.item.copyWith(
          id: event.item.id,
          content: event.item.content,
          itemType: event.item.itemType,
          checked: event.item.checked,
          projectId: event.item.projectId,
          priority: event.item.priority
        )));
      }
    });

    on<CreateItem>((event, emit) async {
      ItemDTO responseDTO = await wsItem.postItem(event.strToken, event.strContent, event.idProject)
                                        .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Registro Correcto", true);
        add(GetItems(event.strToken));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);
    });

    on<UpdateItem>((event, emit) async {

      ItemDTO responseDTO = await wsItem.putItem(event.strToken, event.strContent, event.isComplete, event.vIdItem)
                                        .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Registro Actualizado", true);
        add(GetItems(event.strToken));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);

    });

    on<DeleteItem>((event, emit) async {

      ItemDTO responseDTO = await wsItem.deleteItem(event.strToken, event.vIdItem)
                                        .timeout(const Duration(seconds: 5));
      
      if (responseDTO.success) {
        alert.ToastAlertUtil.alertaToast("Registro Eliminado", null);
        add(GetItems(event.strToken));
        return;
      }
      alert.ToastAlertUtil.alertaToast("NO se obtuvo respuesta", false);

    });
  }
}