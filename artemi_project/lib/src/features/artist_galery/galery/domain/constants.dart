import 'dart:ui';
import 'package:flutter/material.dart';

const List<String> imagePaths = [
  'assets/images/band.jpg',
  'assets/images/comedy.jpg',
  'assets/images/danc.jpg',
  'assets/images/magic.jpg',
  'assets/images/music.jpg',
  'assets/images/paint.jpg',
];

const List<Map<String, String>> artists = [
  {
    'name': '🎸 Band Artist',
    'description':
        "Whether indie, rock or funk - our bands make the stage shake. Perfect for big events, city festivals or unforgettable club nights.",
  },
  {
    'name': '😂 Comedy Artist',
    'description':
        "From stand-up to improv: Our comedy artists make every crowd laugh. Ideal for private parties, corporate events or open mic evenings.",
  },
  {
    'name': '💃 Dance Artist',
    'description':
        "From hip-hop to contemporary to breakdance - our dancers provide pure energy on every stage.",
  },
  {
    'name': '🎩 Magic Artist',
    'description':
        "Magicians and illusionists who will amaze your audience. For children's birthday parties, galas or any show with a wow factor.",
  },
  {
    'name': '🎤 Music Artist',
    'description':
        "Solo artists with voice, style and charisma - whether vocal, rap or instrumental. For intimate sessions, weddings or lounge vibes.",
  },
  {
    'name': '🎨 Paint Artist',
    'description':
        "Live painting, graffiti or portraits - our visual artists turn art into an experience. Ideal for events with a creative touch.",
  },
];

const Color backgroundColor = Color.fromARGB(255, 181, 181, 181);
const Color appBarColor = Colors.black;
const Color titleColor = Colors.yellow;
const Color textColor = Color.fromARGB(255, 0, 0, 0);
const Color buttonColor = Color.fromARGB(255, 1, 105, 223);

const TextStyle titleStyle = TextStyle(
  color: titleColor,
  fontSize: 30,
  fontWeight: FontWeight.w500,
);

const TextStyle nameStyle = TextStyle(
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const TextStyle roleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 32, 32, 31),
);

const TextStyle bodyTextStyle = TextStyle(
  color: textColor,
  fontSize: 15,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);

const TextStyle buttonTextStyle = TextStyle(
  color: buttonColor,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
