part of 'bookdetails_cubit.dart';

abstract class IBookDetailsState extends Equatable {
  const IBookDetailsState();

  @override
  List<Object> get props => [];
}

class BookDetailsInitial extends IBookDetailsState {}

class BookDetailsLoading extends IBookDetailsState {}

class BookDetailsLoaded extends IBookDetailsState {
  final Book book;

 const  BookDetailsLoaded({required this.book});
 
  @override
  List<Object> get props => [book];
}

class BookDetailsError extends IBookDetailsState {
  final String errorMessage;
  const BookDetailsError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
