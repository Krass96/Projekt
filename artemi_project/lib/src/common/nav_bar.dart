import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(
            context,
            Icons.home_filled,
            label: 'Dashboard',
            routeName: '/dashboard',
          ),
          _buildNavBarItem(
            context,
            Icons.event,
            label: 'My Events',
            routeName: '/events',
          ),
          _buildNavBarItem(
            context,
            Icons.favorite,
            label: 'Favorites',
            routeName: '/favorites',
          ),
          _buildNavBarItem(
            context,
            Icons.person,
            label: 'My Stage',
            routeName: '/mystage',
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(BuildContext context, IconData? icon,
      {required String label, required String routeName}) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    final bool isActive = currentRoute == routeName;

    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.pushNamed(context, routeName);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isActive ? Palette.artGold : Palette.textColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Palette.artGold : Palette.textColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
