// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyBgColor extends StatelessWidget {
  BorderRadius? borderRadius;

  MyBgColor({
    super.key,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myBoxDecoration(),
    );
  }

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [
          Color(0xFF666666),
          Color(0xFF000000),
        ],
      ),
    );
  }
}
