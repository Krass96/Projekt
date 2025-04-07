import 'package:artemi_project/config/my_color.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/config/my_font.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required List<NavBarItem> items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          NavBarItem(
            icon: Icons.home_filled,
            label: 'Home',
          ),
          NavBarItem(
            icon: Icons.event,
            label: 'My Events',
          ),
          NavBarItem(
            icon: Icons.favorite,
            label: 'Favorites',
          ),
          NavBarItem(
            icon: Icons.person,
            label: 'Profile',
            isActive: true,
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isActive ? primColor : textColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 30,
            color: isActive ? Colors.black : Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: myFont.fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
