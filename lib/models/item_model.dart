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
}