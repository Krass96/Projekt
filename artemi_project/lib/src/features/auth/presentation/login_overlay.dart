import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/login_form.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/overlay_close.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/overlay_divider.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/overlay_title.dart';

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
  final passwordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.86,
            child: MyBgColor(),
          ),
          Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OverlayTitle(),
              LoginForm(passwordController: passwordController),
            ],
          ),
          OverlayDivider(),
          OverlayClose(),
        ],
      ),
    );
  }
}
