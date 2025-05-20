import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/login_form.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/close_button.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/overlay_title.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/overlay_divider.dart';

void showLoginBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const LoginOverlay(),
  );
}

class LoginOverlay extends StatefulWidget {
  const LoginOverlay({super.key});

  @override
  State<LoginOverlay> createState() => _LoginOverlayState();
}

class _LoginOverlayState extends State<LoginOverlay> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.86,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: MyBgColor(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: OverlayTitle(title: 'Welcome Back! 🖐️'),
              ),
              LoginForm(),
            ],
          ),
          Positioned(top: 15, child: OverlayDivider()),
          Positioned(right: 10, top: 15, child: MyCloseButton()),
        ],
      ),
    );
  }
}
