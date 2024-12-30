import 'package:bloc/bloc.dart';
import 'package:touch_and_solve_inventory_app/Domain/Entities/task_entities.dart';
import '../../../Domain/Usecases/fetch_task_usecases.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FetchTasksUseCase useCase;

  TaskBloc(this.useCase) : super(TaskInitialState()) {
    on<LoadTasksEvent>(_onLoadTasksEvent);
  }

  // Event handler method
  Future<void> _onLoadTasksEvent(
      LoadTasksEvent event,
      Emitter<TaskState> emit,
      ) async {
    emit(TaskLoadingState());
    try {
      print("Loading tasks...");
      final tasks = await useCase.execute();

      // Calculate task counts
      final taskCounts = _calculateTaskCounts(tasks);

      // Emit the loaded state with tasks and task counts
      emit(TaskLoadedState(tasks, taskCounts));
    } catch (error) {
      print("Error loading tasks: $error");
      emit(TaskErrorState(error.toString()));
    }
  }

  // Helper method to calculate task counts
  Map<String, int> _calculateTaskCounts(List<TaskEntity> tasks) {
    final taskCounts = {
      'All': tasks.length,
      'To Do': tasks.where((task) => task.progress == 'To Do' || task.progress == 'Pending').length,
      'In Progress': tasks.where((task) => task.progress == 'In Progress').length,
      'Finish': tasks.where((task) => task.progress == 'Finished').length,
    };
    return taskCounts;
  }
}
