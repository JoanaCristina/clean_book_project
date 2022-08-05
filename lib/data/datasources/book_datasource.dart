import 'package:clean_books/data/models/book_model.dart';


abstract class IBookRemoteDatasource {
  Future<BookModel> requestRandomBook();
}
