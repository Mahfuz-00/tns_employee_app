import 'package:bloc/bloc.dart';
import 'package:touch_and_solve_inventory_app/Domain/Entities/activity_entities.dart';
import '../../../Domain/Usecases/activity_usecases.dart';
import 'activity_event.dart';
import 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityUseCase useCase;

  ActivityBloc(this.useCase) : super(ActivityInitialState()) {
    on<LoadActivityEvent>(_onLoadTasksEvent);
  }

  // Event handler method
  Future<void> _onLoadTasksEvent(
      LoadActivityEvent event,
      Emitter<ActivityState> emit,
      ) async {
    emit(ActivityLoadingState());
    try {
      print("Loading tasks...");
      final tasks = await useCase.execute();

      // Calculate task counts
      final taskCounts = _calculateTaskCounts(tasks);

      // Emit the loaded state with tasks and task counts
      emit(ActivityLoadedState(tasks, taskCounts));
    } catch (error) {
      print("Error loading tasks: $error");
      emit(ActivityErrorState(error.toString()));
    }
  }

  // Helper method to calculate task counts
  Map<String, int> _calculateTaskCounts(List<ActivityEntity> tasks) {
    final taskCounts = {
      'All': tasks.length,
      'To Do': tasks.where((task) => task.progress == 'To Do' || task.progress == 'Pending').length,
      'In Progress': tasks.where((task) => task.progress == 'In Progress').length,
      'Finished': tasks.where((task) => task.progress == 'Complete' || task.progress == 'Finished').length,
    };
    return taskCounts;
  }
}
