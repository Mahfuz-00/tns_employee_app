import 'package:touch_and_solve_inventory_app/Domain/Entities/task_entities.dart';
import '../Repositories/task_repositories.dart';

class FetchTasksUseCase {
  final TaskRepository repository;

  FetchTasksUseCase(this.repository);

  Future<List<TaskEntity>> execute() async {
    // Fetch tasks from the repository (could be remote or local)
    final tasks = await repository.fetchTasks();
    print('Tasks fetched from remote and local -- UseCase:');
    print(tasks);

    // Save fetched tasks to local storage
    await repository.saveTasksToLocal(tasks);
    print('Tasks saved to local storage -- UseCase');

    // Optionally, delete old tasks if needed
    await repository.deleteOldTasks();

    // Fetch the tasks from local storage after saving
    final localTasks = await repository.getLocalTasks();
    print('Tasks fetched from local storage -- Usecase');
    print(localTasks);

    return localTasks;
  }
}
