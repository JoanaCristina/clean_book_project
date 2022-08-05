import 'package:clean_books/domain/entities/datum.dart';
import 'package:equatable/equatable.dart';

class Book extends Equatable {
 const  Book(
      {
        
      required this.status,
      required this.code,
      required this.total,
      required this.data});

   final String status;
   final int code;
   final int total;
   final List<Datum> data;

  @override
  List<Object> get props => [status, code, total, data];
}

