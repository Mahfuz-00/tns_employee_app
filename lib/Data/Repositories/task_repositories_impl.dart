import 'dart:convert';
import 'dart:io';

import 'package:touch_and_solve_inventory_app/Domain/Repositories/task_repositories.dart';
import '../../Domain/Entities/task_entities.dart';
import '../Models/tasks.dart';
import '../Sources/local_data_sources.dart';
import '../Sources/remote_data_sources.dart';

class TaskRepositoryImpl implements TaskRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  TaskRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<TaskEntity>> fetchTasks() async {
    try {
      // Step 1: Fetch tasks from the local data source first (for faster loading)
      final List<TaskEntity> localTasks = await getLocalTasks();
      print('--------------------------------');
      print('Local tasks:');
      localTasks.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Name: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date : ${task.date}, Task Progression : ${task.progression}');
      });
      print('--------------------------------');

      // Step 2: Fetch tasks from the remote data source (API) asynchronously
      final List<TaskModel> taskModels = await remoteDataSource.getTasks();
      print('--------------------------------');
      print('Remote tasks:');
      taskModels.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Name: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date : ${task.date}, Task Progression : ${task.progression}');
      });
      print('--------------------------------');

      // Step 3: Check for new tasks from the remote API that are not in the local database
      final List<TaskModel> newTaskModels = taskModels.where((remoteTask) {
        return !localTasks.any((localTask) =>
        localTask.taskHeader.trim().toLowerCase() == remoteTask.taskHeader.trim().toLowerCase() &&
            localTask.priority == remoteTask.priority &&
            localTask.date == remoteTask.date);
      }).toList();


      print('--------------------------------');
      print('New tasks from remote that are not in local:');
      print('Converting TaskModel to TaskEntity:');
      newTaskModels.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Name: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date : ${task.date}, Task Progression : ${task.progression}');
      });
      print('--------------------------------');

      // Step 4: Save new tasks to the local database
      if (newTaskModels.isNotEmpty) {
        await saveTasksToLocal(newTaskModels); // Call method to save new tasks to local database
        print('New tasks saved to local database');
      }

      // Step 5: Return the combined list of local tasks and new tasks (remote data)
      final allTasks = [
        ...localTasks,
        ...newTaskModels.map((taskModel) => taskModel.toEntity()).toList()
      ];
      print('Returning combined tasks (local + new):');
      allTasks.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Name: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date : ${task.date}, Task Progression : ${task.progression}');
      });

      return allTasks;
    } catch (e) {
      // Handle errors (e.g., network error, parsing error)
      print('Error fetching tasks: $e');
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  @override
  @override
  Future<void> saveTasksToLocal(List<TaskEntity> tasks) async {
    try {
      // Fetch existing tasks from local data source
      final List<TaskEntity> existingTasks = await getLocalTasks();
      print('Existing tasks in local database:');
      existingTasks.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date: ${task.date}, Task Progression: ${task.progression}');
      });

      // Convert TaskEntity to TaskModel before saving
      final List<TaskModel> taskModelsToSave = tasks.map((task) => TaskModel.fromEntity(task)).toList();
      print('Converting tasks to TaskModel:');
      taskModelsToSave.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date: ${task.date}, Task Progression: ${task.progression}');
      });

      // Check if the task already exists in the local database (by comparing taskHeader, priority, and date)
      final List<TaskModel> uniqueTasks = taskModelsToSave.where((taskToSave) {
        return !existingTasks.any((existingTask) =>
        existingTask.taskHeader == taskToSave.taskHeader &&
            existingTask.priority == taskToSave.priority &&
            existingTask.date == taskToSave.date);
      }).toList();

      print('Unique tasks to be saved:');
      uniqueTasks.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date: ${task.date}, Task Progression: ${task.progression}');
      });

      // Save only unique tasks to local storage
      if (uniqueTasks.isNotEmpty) {
        await localDataSource.saveTasks(uniqueTasks);
        print('Successfully saved unique tasks to local storage.');
      } else {
        print('No new unique tasks to save.');
      }
    } catch (e) {
      // Handle errors (e.g., database errors)
      print('Error saving tasks: $e');
      throw Exception('Failed to save tasks to local storage: $e');
    }
  }


  @override
  Future<List<TaskEntity>> getLocalTasks() async {
    try {
      // Fetch tasks from local data source (database or shared preferences)
      final List<TaskModel> taskModels = await localDataSource.getTasks();
      print('Local tasks retrieved from local data source:');
      taskModels.forEach((task) {
        print('Task Header: ${task.taskHeader}, Task Name: ${task.taskHeader}, Task Priority: ${task.priority}, Task Date : ${task.date}, Task Progression : ${task.progression}');
      });

      // Convert TaskModel to TaskEntity and return
      return taskModels.map((taskModel) => taskModel.toEntity()).toList();
    } catch (e) {
      // Handle errors (e.g., database errors)
      print('Error fetching tasks from local storage: $e');
      throw Exception('Failed to fetch tasks from local storage: $e');
    }
  }

  @override
  Future<void> deleteOldTasks() async {
    try {
      // Delete old tasks from local data source
      await localDataSource.deleteOldTasks();
      print('Old tasks deleted from local data source');
    } catch (e) {
      // Handle errors (e.g., database errors)
      print('Error deleting old tasks: $e');
      throw Exception('Failed to delete old tasks: $e');
    }
  }
}
