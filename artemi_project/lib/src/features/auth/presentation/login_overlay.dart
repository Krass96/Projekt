import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/auth/domain/close_button.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';

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
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Opacity(
                opacity: 0.4,
                child: LogoWidget(widht: 90),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  spacing: 24,
                  children: [
                    TextField(
                      decoration: MyInputDecoration.styled(
                          hintText: 'Mail or Username'),
                    ),
                    PasswordField(controller: passwordController),
                    SizedBox(height: 10),
                    Button(
                        width: 200,
                        fontSize: 24,
                        text: 'Login',
                        onPressed: () => Navigator.pop(context))
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 20,
            child: MyCloseButton(),
          ),
        ],
      ),
    );
  }
}
