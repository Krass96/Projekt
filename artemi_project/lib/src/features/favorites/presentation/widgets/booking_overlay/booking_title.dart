import 'package:flutter/material.dart';

class BookingTitle extends StatelessWidget {
  const BookingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Let’s Book it 😎',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
