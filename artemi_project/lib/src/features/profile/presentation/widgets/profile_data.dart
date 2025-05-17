import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatefulWidget {
  final UserProfile user;

  const ProfileData({
    super.key,
    required bool obscureText,
    required this.user,
  }) : _obscureText = obscureText;

  final bool _obscureText;

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

final usernameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();

class _ProfileDataState extends State<ProfileData> {
  late UserProfile user = widget.user;
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TextField(
          controller: usernameController,
          decoration: MyInputDecoration.styled(
              context: context,
              hintText: 'Change your username',
              labelText: user.userName,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
        ),
        PasswordField(
          controller: passwordController,
          showVisibility: false,
          hintText: 'Change your password',
          labelText: user.password,
          obscureText: widget._obscureText,
          onToggleVisibility: _toggleVisibility,
        ),
        TextField(
          controller: emailController,
          decoration: MyInputDecoration.styled(
              context: context,
              hintText: 'Change your mail',
              labelText: user.eMail,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
        ),
      ],
    );
  }
}
