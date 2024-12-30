import 'package:touch_and_solve_inventory_app/Domain/Entities/task_entities.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> fetchTasks();
  Future<void> saveTasksToLocal(List<TaskEntity> tasks);
  Future<List<TaskEntity>> getLocalTasks();
  Future<void> deleteOldTasks();
}
