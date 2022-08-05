import 'package:clean_books/core/errors/failures.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:dartz/dartz.dart';

abstract class IBookRepository {
  Future<Either<Failure, Book>> getRandomBook();
}


