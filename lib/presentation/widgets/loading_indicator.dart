import 'package:clean_books/core/framework/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  CircularProgressIndicator(
        color: secondary,
      ),
    );
  }
}

