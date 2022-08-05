import 'package:clean_books/data/datasources/book_datasource.dart';
import 'package:clean_books/data/datasources/book_remote_datasource_impl.dart';
import 'package:clean_books/data/repositories/book_repository_impl.dart';
import 'package:clean_books/domain/repositories/get_books_repository.dart';
import 'package:clean_books/domain/usecases/get_random_book_usecase.dart';
import 'package:clean_books/domain/usecases/get_random_book_usecase_impl.dart';
import 'package:clean_books/presentation/cubit/books_detail/bookdetails_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initBookDetail();
}

Future<void> initBookDetail() async {
  //! Features - BookDetail
  // Cubit
  sl.registerFactory(() =>BookDetailsCubit(usecase: sl()));

  // usecases
  sl.registerLazySingleton<IGetRandomBookUsecase>(() =>GetRandomBookUsecase(repository: sl()));

  // Repository
  sl.registerLazySingleton<IBookRepository>(() => BookRepositoryImpl(remoteDatasource: sl()));

  // Data sources
  sl.registerLazySingleton<IBookRemoteDatasource>(() => BookRemoteDatasource(client: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}