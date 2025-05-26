import 'package:flutter/material.dart';

class StartOneText extends StatelessWidget {
  const StartOneText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        "Hey, are you looking for an artist for your event? Then you've come to the right place!",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
