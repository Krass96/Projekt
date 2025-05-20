import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class DashboardBar extends StatelessWidget {
  const DashboardBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12,
          children: [
            GestureDetector(
                onTap: () => Navigator.of(context)..pushNamed('/mystage'),
                child: ProfileAvatar(width: 40, height: 40)),
            Text(
              'Hi, Varnaliev 🖐️',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        LogoWidget(width: 35)
      ],
    );
  }
}
