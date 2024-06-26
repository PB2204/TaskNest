import 'package:dartz/dartz.dart';
import '/core/error/failur.dart';
import '/features/todo/domain/entities/todo_enti.dart';
import '/features/todo/domain/repositories/todo_repo.dart';

class InsertTodoUsecase {
  final TodoRepo todoRepo ;
  InsertTodoUsecase({required this.todoRepo}); 
  Future<Either<Failur , Unit>> call (TodoEnti todoEnti) {
    return todoRepo.insertTodo(todoEnti) ;
  }
}