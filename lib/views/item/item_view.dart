import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_diptsv3_todo/bloc/item/item_bloc.dart';
import 'package:flutter_app_diptsv3_todo/models/item_model.dart';
import 'package:flutter_app_diptsv3_todo/models/project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item_model.dart';
import '../../utils/global_util.dart' as global;

class ItemView extends StatefulWidget {
  final String vStrToken;
  final ProjectModel vObjProject;
  const ItemView({ Key? key, required this.vStrToken, required this.vObjProject}): super(key: key);
  
  @override
  ItemViewState createState() => ItemViewState();
}

class ItemViewState extends State<ItemView> {
  TextEditingController ctrItem = TextEditingController();

  @override
  void initState() {
    super.initState();
    ctrItem.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    ctrItem.dispose();
  }

  Future<void> _showFormItemDialog(BuildContext context, ItemModel? vObjItem) async {
    bool isCreate = true;
    if (vObjItem != null && vObjItem.id > 0) {
      ctrItem.text = vObjItem.content;
      isCreate = false;
    }

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('New Item'),
            content: TextField(
              key: const ValueKey('frm-content'),
              controller: ctrItem,
              decoration:
                  const InputDecoration(hintText: "Content of Task"),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                key: const ValueKey('btn-save'),
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    BlocProvider.of<ItemBloc>(context, listen: false).add(
                      (isCreate) 
                      ? CreateItem(widget.vStrToken, ctrItem.value.text, widget.vObjProject.id)
                      : UpdateItem(widget.vStrToken, ctrItem.value.text, vObjItem!.checked, vObjItem.id)
                    );
                    ctrItem.clear();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final itemBloc = BlocProvider.of<ItemBloc>(context, listen: false);
    if (!itemBloc.state.isActive && !itemBloc.state.canEdit) {
      itemBloc.add(GetItems(widget.vStrToken));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(key: const ValueKey('page-title'), widget.vObjProject.content)
      ),
      body: BlocConsumer<ItemBloc, ItemState>(
        bloc: BlocProvider.of<ItemBloc>(context),
        listener: (context, state) {
          if (state.canEdit) {
            _showFormItemDialog(context, state.item);
            return;
          }
        },
        builder: (_, state) {
          return state.isActive
          ? ListItemBuilder(vStrToken: widget.vStrToken, data: state.lstItems!.where((element) => element.projectId == widget.vObjProject.id).toList())
          : const Center(
            child: Text("Cargando..."),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('btn-new'),
        tooltip: 'new-item',
        child: const Icon(Icons.add),
        onPressed: () {
          _showFormItemDialog(context, null);
        },
      ),
    );
  }
}

class ListItemBuilder extends StatelessWidget {
  final String vStrToken;
  final List<ItemModel> data;

  const ListItemBuilder({
    Key? key,
    required this.vStrToken,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemBloc = BlocProvider.of<ItemBloc>(context, listen: false);

    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: data.length,
        itemBuilder: (context, index) => Card(
          elevation: 6,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[700],
              child: Text(data[index].priority.toString()),
            ),
            title: Text("ID: ${data[index].id}"),
            subtitle: Text(key: ValueKey(data[index].content), data[index].content),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              IconButton(key: ValueKey('btn-complete-${data[index].content}'), onPressed: () {
                itemBloc.add(UpdateItem(vStrToken, data[index].content, !data[index].checked, data[index].id));
              }, icon: Icon(Icons.check_circle, color: data[index].checked ? Colors.green : Colors.grey,)),
              IconButton(key: ValueKey('btn-edit-${data[index].content}'), onPressed: () {
                itemBloc.add(EditItem(data[index]));
              }, icon: const Icon(Icons.edit)),
              IconButton(key: ValueKey('btn-delete-${data[index].content}'), onPressed: () {
                itemBloc.add(DeleteItem(vStrToken, data[index].id));
              }, icon: const Icon(Icons.delete)),
            ]),
          ),
        )
      )
    );
  }
}