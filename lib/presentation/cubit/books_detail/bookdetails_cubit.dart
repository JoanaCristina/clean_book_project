import 'package:bloc/bloc.dart';
import 'package:clean_books/domain/usecases/get_random_book_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/errors/failures.dart';
import '../../../domain/entities/book.dart';
part 'bookdetails_state.dart';

class BookDetailsCubit extends Cubit<IBookDetailsState> {
  final IGetRandomBookUsecase usecase;

  BookDetailsCubit({required this.usecase}) : super(BookDetailsInitial());

  void getRandomBook() async {
    emit(BookDetailsLoading());
    var failureOrBook = await usecase();
    emit(_failureOrBook(failureOrBook));
  }

  IBookDetailsState _failureOrBook(Either<Failure, Book> failureOrBook) {
    return failureOrBook.fold(
        (failure) =>
            BookDetailsError(errorMessage: _mapFailureToMessage(failure)),
        (randomBook) => BookDetailsLoaded(book: randomBook));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ocorreu um error, por favor tente carregar os dados novamente';
      case CacheFailure:
        return 'Ocorreu um error ao tentar acessar os dados salvo no dispositivo';
      default:
        return 'Erro inesperado';
    }
  }
}
