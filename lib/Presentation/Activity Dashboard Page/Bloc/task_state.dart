import 'package:touch_and_solve_inventory_app/Domain/Entities/task_entities.dart';

class TaskState {
  final List<TaskEntity> tasks;
  final bool isLoading;
  final String errorMessage;

  TaskState({
    required this.tasks,
    required this.isLoading,
    this.errorMessage = '',
  });

  // Method to copy and modify the state (to avoid direct modification)
  TaskState copyWith({
    List<TaskEntity>? tasks,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Initial state before any tasks are loaded
class TaskInitialState extends TaskState {
  TaskInitialState() : super(tasks: [], isLoading: false, errorMessage: '');
}

// State when tasks are being loaded
class TaskLoadingState extends TaskState {
  TaskLoadingState() : super(tasks: [], isLoading: true, errorMessage: '');
}

// State when tasks are successfully loaded
class TaskLoadedState extends TaskState {
  final Map<String, int> taskCounts; // Store task counts for each section

  TaskLoadedState(List<TaskEntity> tasks, this.taskCounts)
      : super(tasks: tasks, isLoading: false, errorMessage: '');
}


// State when there is an error while loading tasks
class TaskErrorState extends TaskState {
  TaskErrorState(String errorMessage)
      : super(tasks: [], isLoading: false, errorMessage: errorMessage);
}

class TaskSectionCountsState extends TaskState {
  final Map<String, int> sectionCounts;
  TaskSectionCountsState(this.sectionCounts) : super(tasks: [], isLoading: false, errorMessage: '');
}
