import 'package:artemi_project/src/common/app_bar/back_chevron.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;

  const MyAppBar({super.key, required this.title, this.action});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      backgroundColor: const Color(0x00FFEE32),
      actions: [
        if (action != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: action!,
          ),
      ],
      leading: const BackChevron(),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontStyle: FontStyle.normal),
      ),
    );
  }
}
