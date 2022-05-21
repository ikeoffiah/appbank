import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:bankapp/models/user_model.dart';

class DBOperations {
  Database _database;

  DBOperations(this._database);

  Future<void> insert_item(String email, String name, String access_token,
      String refresh_token) async {
    Map<String, Object> user = {
      "id": DateTime.now().millisecond,
      "email": email,
      "name": name,
      "access": access_token,
      "refresh": refresh_token
    };

    await _database.insert('users', user,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserModel>> user() async {
    final List<Map<String, dynamic>> user_map = await _database.query('users');

    return List.generate(user_map.length, (index) {
      return UserModel(
          id: user_map[index]["id"],
          email: user_map[index]["email"],
          access_token: user_map[index]["access_token"]);
    });
  }
}
