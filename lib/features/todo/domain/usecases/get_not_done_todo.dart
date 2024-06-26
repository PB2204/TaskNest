import 'package:dartz/dartz.dart';
import '/core/error/failur.dart';
import '/features/todo/domain/entities/todo_enti.dart';
import '/features/todo/domain/repositories/todo_repo.dart';

class GetNotDoneTodoUsecase {
  final TodoRepo todoRepo ;
  GetNotDoneTodoUsecase({required this.todoRepo}); 
  Future<Either<Failur , List<TodoEnti>>> call () {
    return todoRepo.getNotDoneTodo() ;
  }
}