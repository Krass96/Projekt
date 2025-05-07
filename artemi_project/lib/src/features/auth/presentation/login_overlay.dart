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
  bool? hidePassword = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    bool _hidePassword = true;

    return Scaffold(
      backgroundColor: const Color.fromARGB(151, 156, 152, 152),
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
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('WELCOME BACK',
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                Opacity(opacity: 0.2, child: LogoWidget()),
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
                      TextField(),
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
