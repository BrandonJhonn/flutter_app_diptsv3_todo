import 'package:flutter/material.dart';
import 'package:flutter_app_diptsv3_todo/models/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/global_util.dart' as global;

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  static List<ItemModel> data = [
    ItemModel(
      id: 456, 
      content: "Complete task 1", 
      itemType: 1, 
      checked: false, 
      projectId: 8721, 
      priority: 4
    ),
    ItemModel(
      id: 678, 
      content: "Finish the document of my project", 
      itemType: 1, 
      checked: false, 
      projectId: 8721, 
      priority: 3
    ),
    ItemModel(
      id: 789, 
      content: "Edit some files from my project", 
      itemType: 1, 
      checked: false, 
      projectId: 8721, 
      priority: 2
    )
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('P-TEST-01 - ITEMS')
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[700],
                child: Text(data[index].id.toString()),
              ),
              title: Text(data[index].content),
              subtitle: const Text('In Progress'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ]),
            ),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('btn-new'),
        tooltip: 'new-item',
        child: const Icon(Icons.add),
        onPressed: () {
          /// TODO: Implement
        },
      ),
    );
  }
}