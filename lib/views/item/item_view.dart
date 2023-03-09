import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/global_util.dart' as global;

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item')
      ),
      body: const Center(
        child: Text('Item List'),
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