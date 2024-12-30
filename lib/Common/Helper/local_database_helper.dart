import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._internal();

  factory DatabaseHelper() => instance;

  DatabaseHelper._internal();

  static Future<Database> initializeDatabase() async {
    if (_database != null) return _database!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks_database.db');

    _database = await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER NOT NULL PRIMARY KEY,
            taskHeader TEXT NOT NULL,
            progression REAL NOT NULL,
            images TEXT NOT NULL,
            priority TEXT NOT NULL,
            progress TEXT NOT NULL,
            date TEXT NOT NULL,
            commentCount INTEGER NOT NULL
          )
        ''');
      },
    );
    return _database!;
  }

  // Method to remove duplicates by taskHeader
  static Future<void> removeDuplicates() async {
    final db = await initializeDatabase();

    // Query all tasks from the database
    List<Map<String, dynamic>> rows = await db.query('tasks');

    // Check for duplicates based on taskHeader
    Set<String> seenHeaders = {};  // To track already seen taskHeaders
    for (var row in rows) {
      String taskHeader = row['taskHeader'];

      if (seenHeaders.contains(taskHeader)) {
        // Duplicate found, delete the task
        await db.delete(
          'tasks',
          where: 'taskHeader = ?',
          whereArgs: [taskHeader],
        );
        print('Deleted duplicate task with taskHeader: $taskHeader');
      } else {
        // Mark taskHeader as seen
        seenHeaders.add(taskHeader);
      }
    }
  }

  // Method to print database structure and data
  static Future<void> printDatabaseStructureAndData() async {
    final db = await initializeDatabase();

    if (db == null) {
      print("Database is not initialized.");
      return;
    }

    // Print table structure (columns)
    List<Map<String, dynamic>> columns = await db.rawQuery('PRAGMA table_info(tasks)');
    print("Columns in 'tasks' table:");
    columns.forEach((column) {
      print('Column: ${column['name']}, Type: ${column['type']}');
    });

    // Print all rows in the 'tasks' table
    List<Map<String, dynamic>> rows = await db.query('tasks');
    print("\nRows in 'tasks' table:");
    rows.forEach((row) {
      print(row);
    });
  }
}
