import 'dart:convert';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:touch_and_solve_inventory_app/Domain/Repositories/activity_repositories.dart';
import '../../Domain/Entities/activity_entities.dart';
import '../Models/activity.dart';
import '../Sources/local_data_sources.dart';
import '../Sources/remote_data_sources.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ActivityRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<ActivityEntity>> fetchTasks() async {
    try {
      // Step 1: Fetch tasks from the local data source first (for faster loading)
      final List<ActivityEntity> localTasks = await getLocalTasks();
      print('--------------------------------');
      print('Local activities:');
      localTasks.forEach((task) {
        print('activity Header: ${task.title}, Task Name: ${task.title}, Task Priority: ${task.priority}, Task Date : ${task.startDate}');
      });
      print('--------------------------------');

      // Step 2: Fetch tasks from the remote data source (API) asynchronously
      final List<ActivityModel> taskModels = await remoteDataSource.getTasks();
      print('--------------------------------');
      print('Remote activities:');
      taskModels.forEach((task) {
        print('activity Header: ${task.title}, Task Name: ${task.title}, Task Priority: ${task.priority}, Task Date : ${task.startDate}');
      });
      print('--------------------------------');

      // Step 3: Check for new tasks from the remote API that are not in the local database
      final List<ActivityModel> newTaskModels = taskModels.where((remoteTask) {
        return !localTasks.any((localTask) =>
        localTask.title?.trim().toLowerCase() == remoteTask.title?.trim().toLowerCase() &&
            localTask.priority == remoteTask.priority &&
            localTask.startDate == remoteTask.startDate);
      }).toList();


      print('--------------------------------');
      print('New activities from remote that are not in local:');
      print('Converting activityModel to activityEntity:');
      newTaskModels.forEach((task) {
        print('activity Header: ${task.title}, Task Name: ${task.title}, Task Priority: ${task.priority}, Task Date : ${task.startDate}, Task Assignor : ${task.assignor}');
      });
      print('--------------------------------');

      // Step 4: Save new tasks to the local database
      if (newTaskModels.isNotEmpty) {
        final List<ActivityEntity> activityEntities =
        newTaskModels.map((task) => task.toEntity()).toList();
        await saveTasksToLocal(activityEntities); // Call method to save new tasks to local database
        print('New activities saved to local database');
      }

      // Step 5: Return the combined list of local tasks and new tasks (remote data)
      final allTasks = [
        ...localTasks,
        ...newTaskModels.map((taskModel) => taskModel.toEntity()).toList()
      ];
      print('Returning combined activities (local + new):');
      allTasks.forEach((task) {
        print('activity Header: ${task.title}, Task Name: ${task.title}, Task Priority: ${task.priority}, Task Date : ${task.startDate}');
      });

      return allTasks;
    } catch (e) {
      // Handle errors (e.g., network error, parsing error)
      print('Error fetching tasks: $e');
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  @override
  Future<void> saveTasksToLocal(List<ActivityEntity> tasks) async {
    try {
      // Fetch existing tasks from local data source
      final List<ActivityEntity> existingTasks = await getLocalTasks();
      print('Existing activities in local database:');
      existingTasks.forEach((task) {
        print('Task Header: ${task.title}, Task Priority: ${task.priority}, Task Date: ${task.startDate}');
      });

      // Convert TaskEntity to TaskModel before saving
      final List<ActivityModel> taskModelsToSave = tasks.map((task) => ActivityModel.fromEntity(task)).toList();
      print('Converting activities to activityModel:');
      taskModelsToSave.forEach((task) {
        print('Task Header: ${task.title}, Task Priority: ${task.priority}, Task Date: ${task.startDate}');
      });

      // Check if the task already exists in the local database (by comparing taskHeader, priority, and date)
      final List<ActivityModel> uniqueTasks = taskModelsToSave.where((taskToSave) {
        return !existingTasks.any((existingTask) =>
        existingTask.title == taskToSave.title &&
            existingTask.priority == taskToSave.priority &&
            existingTask.startDate == taskToSave.startDate);
      }).toList();

      print('Unique activities to be saved:');
      uniqueTasks.forEach((task) {
        print('Task Header: ${task.title}, Task Priority: ${task.priority}, Task Date: ${task.startDate}');
      });

      // Save only unique tasks to local storage
      if (uniqueTasks.isNotEmpty) {
        // Directly save as ActivityModel (do not convert to ActivityEntity)
        await localDataSource.saveTasks(uniqueTasks);
        print('Successfully saved unique tasks to local storage.');
      } else {
        print('No new unique tasks to save.');
      }
    } catch (e) {
      // Handle errors (e.g., database errors)
      print('Error occurred while saving activities: $e');
      if (e is DatabaseException) {
        print('Database error: ${e.toString()}'); // Use e.toString() to access the full error message
      } else if (e is SocketException) {
        print('Network error: ${e.message}');
      } else {
        print('Unknown error: ${e.toString()}');
      }
      throw Exception('Failed to save activities to local storage: $e');
    }
  }





  @override
  Future<List<ActivityEntity>> getLocalTasks() async {
    try {
      // Fetch tasks from local data source (database or shared preferences)
      final List<ActivityModel> taskModels = await localDataSource.getTasks();
      print('Local activities retrieved from local data source:');
      taskModels.forEach((task) {
        print('activity Header: ${task.title}, Task Name: ${task.title}, Task Priority: ${task.priority}, Task Date : ${task.startDate}');
      });

      // Convert TaskModel to TaskEntity and return
      return taskModels.map((taskModel) => taskModel.toEntity()).toList();
    } catch (e) {
      // Handle errors (e.g., database errors)
      print('Error fetching activities from local storage: $e');
      throw Exception('Failed to fetch activities from local storage: $e');
    }
  }

  @override
  Future<void> deleteOldTasks() async {
    try {
      // Delete old tasks from local data source
      await localDataSource.deleteOldTasks();
      print('Old activities deleted from local data source');
    } catch (e) {
      // Handle errors (e.g., database errors)
      print('Error deleting old activities: $e');
      throw Exception('Failed to delete old activities: $e');
    }
  }
}
