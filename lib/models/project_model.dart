import 'dart:convert';

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

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    ProjectModel obj;
    try {
      if (json.isEmpty) {
        obj = ProjectModel(
          id: 0, 
          content: "", 
          itemsCount: 0, 
          parentId: 0, 
          children: []
        );
      } else {
        obj = ProjectModel(
          id: json['Id'], 
          content: json['Content'], 
          itemsCount: json['ItemsCount'], 
          parentId: json['ParentId'], 
          children: []
        );

        if (json['Children'] != null) {
          var lstChildren = json['Children'] as List;
          obj.children = lstChildren.map((item) => ProjectModel.fromJson(item)).toList();
        }
      }
    } catch (e) {
      rethrow;
    }
    return obj;
  }
}