import 'package:clean_books/domain/entities/datum.dart';

class DatumModel extends Datum {
  const DatumModel(
      {required this.title,
      required this.author,
      required this.genre,
      required this.description,
      required this.isbn,
      required this.image,
      required this.published,
      required this.publisher}):
      super(
        title:title, 
        author: author, 
        genre: genre,
         description: description, 
         isbn: isbn,
          image: image,
          published: published,
         publisher:publisher,
);

   final String title;
   final String author;
   final String genre;
   final String description;
   final String isbn;
   final String image;
   final DateTime published;
   final String publisher;




  factory DatumModel.fromMap(Map<String, dynamic> map) {
    return DatumModel(
        title: map['title'],
        author: map['author'],
        genre: map['genre'],
        description: map['description'],
        isbn: map['isbn'],
        image: map['image'],
        published: DateTime.parse(map['published']),
        publisher: map['publisher']);
  }
}
