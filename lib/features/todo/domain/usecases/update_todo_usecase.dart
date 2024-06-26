import 'package:dartz/dartz.dart';
import '/core/error/failur.dart';
import '/features/todo/domain/repositories/todo_repo.dart';

class UpdateTodoUsecase {
  final TodoRepo todoRepo ;
  UpdateTodoUsecase({required this.todoRepo}); 
  Future<Either<Failur,Unit>> call (int idTodo) {
    return todoRepo.updateTodo(idTodo) ;
  }
}