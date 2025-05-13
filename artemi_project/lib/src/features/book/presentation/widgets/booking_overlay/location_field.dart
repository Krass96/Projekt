import 'package:artemi_project/src/common/text_field.dart';
import 'package:flutter/material.dart';

class LocationField extends StatelessWidget {
  const LocationField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: MyInputDecoration.styled(
          suffixIcon: const Icon(Icons.location_on),
          context: context,
          hintText: 'Enter your Event Location',
          labelText: 'Event Location',
        ),
      ),
    );
  }
}
