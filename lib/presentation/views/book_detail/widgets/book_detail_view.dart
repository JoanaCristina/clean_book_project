import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/presentation/cubit/books_detail/bookdetails_cubit.dart';
import 'package:clean_books/presentation/views/book_detail/widgets/book_detail_desktop.dart';
import 'package:clean_books/presentation/views/book_detail/widgets/book_detail_mobile.dart';
import 'package:clean_books/presentation/widgets/error_message.dart';
import 'package:clean_books/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../injection_container.dart';

class BookDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => sl<BookDetailsCubit>(),
      child: BlocBuilder<BookDetailsCubit, IBookDetailsState>(
        builder: (context, state) {
          return _buildContentFromState(context, state, size);
        },
      ),
    );
  }

  Widget _buildContentFromState(
    BuildContext context,
    IBookDetailsState state,
    Size size,
  ) {
    if (state is BookDetailsInitial) {
      _getRandomBook(context);
      return LoadingIndicator();
    } else if (state is BookDetailsLoading) {
      return LoadingIndicator();
    } else if (state is BookDetailsLoaded) {
      final book = state.book;
      return ScreenTypeLayout(
        mobile: BookDetailMobile(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
        desktop: BookDetailDesktop(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
        tablet: BookDetailDesktop(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
      );
    } else if (state is BookDetailsError) {
      return ErrorMessage(
        message: state.errorMessage,
        onPressed: () => _getRandomBook(context),
      );
    } else {
      return Container(
        child: Center(
          child: Text('Error'),
        ),
      );
    }
  }

  void _getRandomBook(BuildContext context, {Book? book}) async {
    if (book != null) {
      await evictImage(book.data.first.image);
    }

    final bookDetailCubit = context.read<BookDetailsCubit>();
    bookDetailCubit.getRandomBook();
  }

  Future<void> evictImage(String imageURL) async {
    final NetworkImage provider = NetworkImage(imageURL);
    await provider.evict();
  }
}
