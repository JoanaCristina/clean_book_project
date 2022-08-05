import 'package:clean_books/core/errors/exceptions.dart';
import 'package:clean_books/data/datasources/book_datasource.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/core/errors/failures.dart';
import 'package:clean_books/domain/repositories/get_books_repository.dart';
import 'package:dartz/dartz.dart';

class BookRepositoryImpl implements IBookRepository {
  IBookRemoteDatasource remoteDatasource;

  BookRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, Book>> getRandomBook() async {
    try {
      var result = await remoteDatasource.requestRandomBook();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(
          message: 'Ocorreu um erro ao tentar obter os dados do servidor'));
    }
  }
}
