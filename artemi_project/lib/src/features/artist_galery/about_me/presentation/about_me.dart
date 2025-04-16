import 'package:artemi_project/src/features/artist_galery/about_me/domain/custom_text_button.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    const fullText =
        'As a newly minted Junior App and Software Developer, I bring my expertise in logistics planning and design into the world of software development. With a background in computer graphics and design, I combine technical know-how with creative problem-solving to develop innovative applications.';

    const shortText =
        'As a newly minted Junior App and Software Developer, I bring my expertise in logistics planning and design...';

    const backgroundColor = Color.fromARGB(255, 181, 181, 181);
    const titleStyle = TextStyle(
        color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.w500);
    const nameStyle = TextStyle(
        color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold);
    const roleStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Color.fromARGB(255, 32, 32, 31));
    const bodyTextStyle = TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'About Me',
          style: titleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/my_card.png',
                  width: 300,
                ),
              ),
            ),
            Text(
              'Krasimir Varnaliev',
              style: nameStyle,
            ),
            Text(
              'Artemi Founder',
              style: roleStyle,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    isExpanded ? fullText : shortText,
                    style: bodyTextStyle,
                  ),
                  CustomTextButton(
                    text: isExpanded ? 'Show less ^^^' : 'Read more >>>',
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
