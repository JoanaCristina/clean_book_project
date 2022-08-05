import 'package:clean_books/core/errors/exceptions.dart';
import 'package:clean_books/data/datasources/book_datasource.dart';
import 'package:clean_books/data/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookRemoteDatasource implements IBookRemoteDatasource {
  BookRemoteDatasource({required this.client});

  final http.Client client;

  @override
  Future<BookModel> requestRandomBook() async {
    const String url = 'https://fakerapi.it/api/v1/books?_quantity=1&_locale=es_ES';
    final uri = Uri.parse(url);
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      return bookFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
