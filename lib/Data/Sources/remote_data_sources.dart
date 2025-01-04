import '../Models/tasks.dart';
import 'activity_remote_source.dart';
import 'signin_remote_source.dart';

class RemoteDataSource {
  final TaskRemoteDataSource taskDataSource = TaskRemoteDataSource();
  final AuthenticationRemoteDataSource authDataSource = AuthenticationRemoteDataSource();

  // Expose task data fetching functionality
  Future<List<TaskModel>> getTasks() async {
    return await taskDataSource.getTasks();
  }

  // Expose authentication functionality
  Future<String> authenticateUsingMockJson(String email, String password) async {
    return await authDataSource.authenticateUsingMockJson(email, password);
  }

  Future<String> authenticate(String email, String password) async {
    return await authDataSource.authenticate(email, password);
  }
}
