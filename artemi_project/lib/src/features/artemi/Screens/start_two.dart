import 'package:artemi_project/src/widgets/start_one_scala.dart';
import 'package:artemi_project/src/theme/my_font.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StartTwo extends StatelessWidget {
  const StartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: const Icon(
              LucideIcons.chevronLeft,
              color: Color(0xFFFFEE32),
              size: 40,
            ),
            actions: [
              StartOneScala(
                widthYellow: 300,
              ),
            ],
          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  'You are',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: myFont.fontFamily,
                      fontSize: 50),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    transform: Matrix4.identity()..rotateZ(0.09),
                    width: 150,
                    height: 170,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/artist_scene.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(12.31),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Container(
                      transform: Matrix4.identity()..rotateZ(-0.07),
                      width: 150,
                      height: 170,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/app_nutzer.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(12.31),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/you_are.png'),
            ],
          ),
        ),
      ),
    );
  }
}
