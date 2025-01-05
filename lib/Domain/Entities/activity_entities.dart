class ActivityEntity {
  final int id;
  final String taskHeader;
  final double progression;
  final List<String> images;
  final String priority;
  final String progress;
  final String date;
  final String commentCount;

  ActivityEntity({
    required this.id,
    required this.taskHeader,
    required this.progression,
    required this.images,
    required this.priority,
    required this.progress,
    required this.date,
    required this.commentCount,
  });
}
