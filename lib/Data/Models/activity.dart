import '../../Domain/Entities/activity_entities.dart';

class ActivityModel {
  final int? id;
  final String? title;
  final String? project;
  final String? startDate;
  final String? endDate;
  final String? estimateHours;
  final int? assignor;
  final String? assignorId;
  final String? description;
  final String? comment;
  final String? priority;
  final String? status;  // Nullable field
  final DateTime? updatedAt;
  final List<AssignedUserModel>? assignedUsers;

  ActivityModel({
    this.id,
    this.title,
    this.project,
    this.startDate,
    this.endDate,
    this.estimateHours,
    this.assignor,
    this.assignorId,
    this.description,
    this.comment,
    this.priority,
    this.status,
    this.updatedAt,
    this.assignedUsers,
  });

  // Method to convert from ActivityEntity to ActivityModel
  factory ActivityModel.fromEntity(ActivityEntity entity) {
    return ActivityModel(
      id: entity.id,
      title: entity.title,
      project: entity.project,
      startDate: entity.startDate,
      endDate: entity.endDate,
      estimateHours: entity.estimateHours,
      assignor: entity.assignor,
     /* assignorId: entity.assignorId,*/
      description: entity.description,
      comment: entity.comment,
      priority: entity.priority,
      status: entity.status,
      updatedAt: entity.updatedAt,
      assignedUsers: entity.assignedUsers
          ?.map((assignedUserEntity) => AssignedUserModel.fromEntity(assignedUserEntity))
          .toList(),
    );
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      title: json['title'],
      project: json['project'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      estimateHours: json['estimate_hours'],
      assignor: json['assignor'],
    /*  assignorId: json['user_assign_id'],*/
      description: json['description'],
      comment: json['comment'],
      priority: json['priority'],
      status: json['status'],
      updatedAt: DateTime.parse(json['updated_at']),
      assignedUsers: (json['assigned_users'] as List?)
          ?.map((user) => AssignedUserModel.fromJson(user))  // Changed from `AssignedUserEntity.fromJson` to `AssignedUserModel.fromJson`
          .toList(),
    );
  }

  // Convert ActivityModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'project': project,
      'start_date': startDate,
      'end_date': endDate,
      'estimate_hours': estimateHours,
      'description': description,
      'assignor': assignor,
     /* 'user_assign_id' : assignorId,*/
      'comment': comment,
      'priority': priority,
      'status': status,  // Nullable field
      'updated_at': updatedAt?.toIso8601String(),  // Format DateTime as ISO string
      'assigned_users': assignedUsers?.map((user) => user.toJson()).toList(),
    };
  }

  // Convert ActivityModel to ActivityEntity
  ActivityEntity toEntity() {
    return ActivityEntity(
      id: id,
      title: title,
      project: project,
      startDate: startDate,
      endDate: endDate,
      estimateHours: estimateHours,
      assignor: assignor,
     /* assignorId: assignorId,*/
      description: description,
      comment: comment,
      priority: priority,
      status: status,
      updatedAt: updatedAt,
      assignedUsers: assignedUsers?.map((user) => user.toEntity()).toList(),
    );
  }

  @override
  String toString() {
    return 'ActivityModel{id: $id, title: $title, project: $project}';
  }
}

class AssignedUserModel {
  final int? id;
  final String? name;
  final String? profilePhotoPath;  // Nullable field

  AssignedUserModel({
    this.id,
    this.name,
    this.profilePhotoPath,  // Nullable field
  });

  factory AssignedUserModel.fromJson(Map<String, dynamic> json) {
    return AssignedUserModel(
      id: json['id'],
      name: json['name'],
      profilePhotoPath: json['profile_photo_path'],
    );
  }

  // Method to convert from AssignedUserEntity to AssignedUserModel
  factory AssignedUserModel.fromEntity(AssignedUserEntity entity) {
    return AssignedUserModel(
      id: entity.id,
      name: entity.name,
      profilePhotoPath: entity.profilePhotoPath,  // Nullable field
    );
  }

  // Convert AssignedUserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profile_photo_path': profilePhotoPath,  // Nullable field
    };
  }

  // Convert AssignedUserModel to AssignedUserEntity
  AssignedUserEntity toEntity() {
    return AssignedUserEntity(
      id: id,
      name: name,
      profilePhotoPath: profilePhotoPath,
    );
  }
}
