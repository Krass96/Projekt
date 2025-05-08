import 'package:artemi_project/src/common/back_chevron.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

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
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/my_portre.png'),
          ),
        )
      ],
      leading: const BackChevron(),
      title: Text(
        'My Events',
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontStyle: FontStyle.normal),
      ),
    );
  }
}
