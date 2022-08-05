import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/book.dart';

abstract class IGetRandomBookUsecase {
  Future<Either<Failure, Book>> call();
}