import 'package:flutter/material.dart';
import 'galery/presentation/artist_galery.dart';
import 'about_me/presentation/about_me.dart';

class Galery extends StatefulWidget {
  const Galery({super.key});

  @override
  State<Galery> createState() => _GaleryState();
}

class _GaleryState extends State<Galery> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ArtistGalery(),
    const AboutMe(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Me',
          ),
        ],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}
