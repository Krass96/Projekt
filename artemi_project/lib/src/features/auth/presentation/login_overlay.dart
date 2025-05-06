import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/auth/domain/close_button.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class LoginOverlay extends StatefulWidget {
  const LoginOverlay({super.key});

  @override
  State<LoginOverlay> createState() => _LoginOverlayState();
}

class _LoginOverlayState extends State<LoginOverlay> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    bool hidePassword;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 216, 216),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.85,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.black),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('WELCOME BACK',
                    style: Theme.of(context).textTheme.displaySmall),
                SizedBox(height: 100),
                Opacity(opacity: 0.1, child: LogoWidget()),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: textController,
                        cursorColor: Palette.artGold,
                        decoration: InputDecoration(
                            hintText: 'Mail / Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => textController.clear(),
                              icon: Icon(Icons.clear),
                            )),
                      ),
                      TextField(
                        obscureText: hidePassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          suffix: IconButton(
                            icon: Icon(hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => setState(
                              () {
                                hidePassword = !hidePassword;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MyCloseButton(),
        ],
      ),
    );
  }
}
