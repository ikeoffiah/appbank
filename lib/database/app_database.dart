import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> initDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'user.db'),

      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, name TEXT, access_token TEXT, refresh_token TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }
}
