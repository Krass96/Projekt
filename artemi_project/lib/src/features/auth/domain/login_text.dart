import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      bottom: 120,
      left: 0,
      right: 177,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
              children: [
                const TextSpan(text: 'Book the '),
                TextSpan(
                  text: 'Best',
                  style: const TextStyle(color: Colors.yellow),
                ),
                const TextSpan(text: ', \nForget the Rest'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
