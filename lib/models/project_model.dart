class ProjectModel {
  int id;
  String content;
  int itemsCount;
  int? parentId;
  List<ProjectModel> children;

  ProjectModel({
    required this.id,
    required this.content,
    required this.itemsCount,
    required this.parentId,
    required this.children
  });

  ProjectModel copyWith({
    int? id,
    String? content,
    int? itemsCount,
    int? parentId,
    List<ProjectModel>? children 
  }) => ProjectModel(
    id: id ?? this.id, 
    content: content ?? this.content, 
    itemsCount: itemsCount ?? this.itemsCount, 
    parentId: parentId ?? this.parentId, 
    children: children ?? this.children
  );
}