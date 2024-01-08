class GroupModel {
  int? id;
  String? groupName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? groupId;

  GroupModel({
    this.id,
    this.groupName,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.groupId,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        id: json['id'] as int?,
        groupName: json['group_name'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        userId: json['user_id'] as int?,
        groupId: json['group_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'group_name': groupName,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_id': userId,
        'group_id': groupId,
      };
}
