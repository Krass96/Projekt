import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/close_button.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/overlay_divider.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/overlay_title.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/sign_up_form.dart';

void showSignUpBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const SignUpOverlay(),
  );
}

class SignUpOverlay extends StatefulWidget {
  const SignUpOverlay({super.key});

  @override
  State<SignUpOverlay> createState() => _SignUpOverlayState();
}

class _SignUpOverlayState extends State<SignUpOverlay> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: const OverlayTitle(title: 'Create Account  ✍️'),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SignUpForm(
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController),
              ),
            ],
          ),
          const Positioned(
            top: 5,
            right: 20,
            child: MyCloseButton(),
          ),
          OverlayDivider(),
        ],
      ),
    );
  }
}
