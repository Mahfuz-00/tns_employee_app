import 'package:touch_and_solve_inventory_app/Domain/Entities/task_entities.dart';
import '../Repositories/task_repositories.dart';

class FetchTasksUseCase {
  final TaskRepository repository;

  FetchTasksUseCase(this.repository);

  Future<List<TaskEntity>> execute() async {
    try {
      // Step 1: Fetch tasks from the local data source first (for faster loading)
      final localTasks = await repository.getLocalTasks();
      print('Tasks fetched from local storage -- UseCase:');
      print(localTasks);

      // Step 5: Optionally, delete old tasks if necessary
      await repository.deleteOldTasks();

      // Step 2: Fetch tasks from the remote data source (API)
      final remoteTasks = await repository.fetchTasks();
      print('Tasks fetched from remote storage -- UseCase:');
      print(remoteTasks);

      // Step 3: Combine tasks from both sources
      // Ensure that tasks from remote are not duplicated with tasks from local storage
      final allTasks = [...localTasks];

      // Add remote tasks that do not already exist in local tasks
      remoteTasks.forEach((remoteTask) {
        if (!localTasks.any((localTask) => localTask.taskHeader == remoteTask.taskHeader)) {
          allTasks.add(remoteTask);
        }
      });

      print('Combined tasks (local + remote):');
      print(allTasks);

      // Step 4: Save any new tasks to local storage (remote tasks that were not previously saved)
      await repository.saveTasksToLocal(allTasks);
      print('Combined tasks saved to local storage -- UseCase');

      // Step 6: Fetch the tasks from local storage after saving and delete old tasks
      final updatedLocalTasks = await repository.getLocalTasks();
      print('Tasks fetched from local storage after update -- UseCase:');
      print(updatedLocalTasks);

      return allTasks;
    } catch (e) {
      print('Error in FetchTasksUseCase: $e');
      throw Exception('Failed to fetch and combine tasks: $e');
    }
  }
}

