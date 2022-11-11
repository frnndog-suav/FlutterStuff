import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/database/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tableName = "TaskTable";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  static const String tableSql = "CREATE TABLE $_tableName("
      "$_name TEXT,"
      "$_difficulty INTEGER,"
      "$_image TEXT"
      ")";

  save(Task tarefa) async {
    final Database db = await getDatabase();
    var itemExists = await find(tarefa.nome);
    if (itemExists.isEmpty) {
      return await db.insert(_tableName, toMap(tarefa));
    } else {
      return await db.update(_tableName, toMap(tarefa),
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];

    for (Map<String, dynamic> tarefa in mapaDeTarefas) {
      final Task task =
          Task(tarefa[_name], tarefa[_image], tarefa[_difficulty]);
      tarefas.add(task);
    }

    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database db = await getDatabase();
    db.delete(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }

  Map<String, dynamic> toMap(Task tarefa) {
    final Map<String, dynamic> mapadeTarefas = {};
    mapadeTarefas[_name] = tarefa.nome;
    mapadeTarefas[_difficulty] = tarefa.dificuldade;
    mapadeTarefas[_image] = tarefa.foto;
    return mapadeTarefas;
  }
}
