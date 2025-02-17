import 'package:dartz/dartz.dart';
import '/core/error/failur.dart';
import '/features/todo/domain/entities/todo_enti.dart';

abstract class TodoRepo {
  Future<Either<Failur , List<TodoEnti>>> getDoneTodo() ;  
  Future<Either<Failur , List<TodoEnti>>> getNotDoneTodo() ;  
  Future<Either<Failur , Unit>> insertTodo(TodoEnti todoEnti) ;  
  Future<Either<Failur , Unit>> updateTodo(int idTodo) ;  
}