import 'package:clean_books/core/errors/failures.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/domain/repositories/get_books_repository.dart';
import 'package:clean_books/domain/usecases/get_random_book_usecase.dart';
import 'package:dartz/dartz.dart';



class GetRandomBookUsecase implements IGetRandomBookUsecase {
  final IBookRepository repository;

  GetRandomBookUsecase({required this.repository});

  @override
  Future<Either<Failure, Book>> call() async{
    return await repository.getRandomBook();
  }
}
