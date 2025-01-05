import '../../Domain/Entities/activity_entities.dart';

class ActivityModel extends ActivityEntity {
  ActivityModel({
    required int id,
    required String taskHeader,
    required double progression,
    required List<String> images,
    required String priority,
    required String progress,
    required String date,
    required int commentCount,
  }) : super(
    id: id,
    taskHeader: taskHeader,
    progression: progression,
    images: images,
    priority: priority,
    progress: progress,
    date: date,
    commentCount: commentCount.toString(),
  );

  // Convert JSON data into a TaskModel
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] ?? 0,
      taskHeader: json['taskHeader'] ?? '',
      progression: json['progression'] ?? 0.0,
      images: (json['images'] as String).split(',') ?? [],  // Split the string into a list
    /*  images: List<String>.from(json['images'] ?? []),*/
      priority: json['priority'] ?? '',
      progress: json['progress'] ?? '',
      date: json['date'] ?? '',
      commentCount: json['commentCount'] ?? '',
    );
  }

  // Convert TaskModel into JSON data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskHeader': taskHeader,
      'progression': progression,
      'images': images.join(','), // Join the list into a comma-separated string
   /*   'images': images,*/
      'priority': priority,
      'progress': progress,
      'date': date,
      'commentCount': commentCount,
    };
  }

  // Convert TaskModel to TaskEntity
  ActivityEntity toEntity() {
    return ActivityEntity(
      id: id,
      taskHeader: taskHeader,
      progression: progression,
      images: images,
      priority: priority,
      progress: progress,
      date: date,
      commentCount: commentCount,
    );
  }

  // Convert TaskEntity to TaskModel
  static ActivityModel fromEntity(ActivityEntity entity) {
    return ActivityModel(
      id: entity.id,
      taskHeader: entity.taskHeader,
      progression: entity.progression,
      images: entity.images,
      priority: entity.priority,
      progress: entity.progress,
      date: entity.date,
      commentCount: int.tryParse(entity.commentCount) ?? 0,
    );
  }
}
