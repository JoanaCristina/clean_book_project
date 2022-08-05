import 'package:equatable/equatable.dart';

class Datum extends Equatable{
  final String title;
  final String author;
  final String genre;
  final String description;
  final String isbn;
  final String image;
  final DateTime published;
  final String publisher;

  const Datum(
      {required this.title,
      required this.author,
      required this.genre,
      required this.description,
      required this.isbn,
      required this.image,
      required this.published,
      required this.publisher});
      
        @override
   
        List<Object?> get props => [title, author, genre, description, isbn, image,published, publisher ];
}
