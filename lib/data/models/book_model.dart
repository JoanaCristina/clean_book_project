import 'dart:convert';

import 'package:clean_books/data/models/datum_model.dart';
import 'package:clean_books/domain/entities/book.dart';


BookModel bookFromJson(String str) => BookModel.fromMap(json.decode(str));

class BookModel extends Book {
  const BookModel(
      {required super.status,
      required super.code,
      required super.total,
      required super.data});

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      status: map['status'],
      code: map['code'],
      total: map['total'],
      data:List<DatumModel>.from(map['data'].map((value)=>DatumModel.fromMap(value))) ,
    );
  }
}


