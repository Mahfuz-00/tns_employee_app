import 'package:sqflite/sqflite.dart';
import '../Models/activity.dart';

class LocalDataSource {
  final Database db;

  LocalDataSource(this.db);

  // Save a list of tasks to the local database
  Future<void> saveTasks(List<ActivityModel> tasks) async {
    for (final task in tasks) {
      try {
        await db.insert(
          'tasks',
          task.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace, // Use replace to update existing tasks with the same taskHeader
        );
        print("Task being saved: ${task.toJson()}");
      } catch (e) {
        print("Failed to save task: ${task.taskHeader}, Error: $e");
      }
    }
  }




  // Fetch tasks from the local database
  Future<List<ActivityModel>> getTasks() async {
    final result = await db.query('tasks');
    return result.map((e) => ActivityModel.fromJson(e)).toList();
  }

  // Delete old tasks from the local database
  Future<void> deleteOldTasks() async {
    final cutoffDate = DateTime.now().subtract(Duration(days: 15));
    await db.delete('tasks',
        where: 'date < ?', whereArgs: [cutoffDate.toIso8601String()]);
  }
}
