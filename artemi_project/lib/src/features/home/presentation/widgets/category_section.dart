import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.menu,
            //     size: 30,
            //   ),
            // )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12,
            children: [
              Button(
                text: '🎵 Music',
              ),
              Button(
                text: '💃 Dance',
              ),
              Button(
                text: '🎨 Paint',
              ),
              Button(
                text: '😄 Comedy',
              ),
              Button(
                text: '🎩 Magic',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
