import 'dart:convert';

class ItemModel {
  int id;
  String content;
  int itemType;
  bool checked;
  int projectId;
  int priority;

  ItemModel({
    required this.id,
    required this.content,
    required this.itemType,
    required this.checked,
    required this.projectId,
    required this.priority
  });

  ItemModel copyWith({
    int? id,
    String? content,
    int? itemType,
    bool? checked,
    int? projectId,
    int? priority 
  }) => ItemModel(
    id: id ?? this.id, 
    content: content ?? this.content, 
    itemType: itemType ?? this.itemType, 
    checked: checked ?? this.checked, 
    projectId: projectId ?? this.projectId, 
    priority: priority ?? this.priority
  );

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    ItemModel obj;
    try {
      if (json.isEmpty) {
        obj = ItemModel(
          id: 0, 
          content: "", 
          itemType: 0, 
          checked: false, 
          projectId: 0,
          priority: 0
        );
      } else {
        obj = ItemModel(
          id: json['Id'], 
          content: json['Content'], 
          itemType: json['ItemType'], 
          checked: json['Checked'], 
          projectId: json['ProjectId'],
          priority: json['Priority']
        );
      }
    } catch (e) {
      rethrow;
    }
    return obj;
  }
}