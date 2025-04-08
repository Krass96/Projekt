import 'package:artemi_project/config/my_color.dart';
import 'package:artemi_project/config/my_font.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DateLabel extends StatelessWidget {
  final String text;

  const DateLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.37, color: Colors.white),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(18.54),
            bottomRight: Radius.circular(5.56),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.25,
                fontFamily: myFont.fontFamily,
                fontWeight: FontWeight.w500,
                height: 1.67,
              ),
            ),
          ),
          Icon(
            LucideIcons.chevronDown,
            color: primColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}
