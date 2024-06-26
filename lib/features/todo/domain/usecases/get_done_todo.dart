import 'package:dartz/dartz.dart';
import '/core/error/failur.dart';
import '/features/todo/domain/entities/todo_enti.dart';
import '/features/todo/domain/repositories/todo_repo.dart';

class GetDoneTodoUsecase {
  final TodoRepo todoRepo ;
  GetDoneTodoUsecase({required this.todoRepo});
   Future<Either<Failur , List<TodoEnti>>> call () async {
    return todoRepo.getDoneTodo();
   }
}