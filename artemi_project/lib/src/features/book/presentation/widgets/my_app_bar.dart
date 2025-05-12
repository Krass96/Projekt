import 'package:artemi_project/src/common/back_chevron.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

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
      actions: const [
        Padding(
            padding: EdgeInsets.all(8.0),
            child: ProfileAvatar(width: 50, height: 50))
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
