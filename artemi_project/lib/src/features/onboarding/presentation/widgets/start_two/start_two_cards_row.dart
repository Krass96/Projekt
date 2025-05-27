import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class StartTwoCardsRow extends StatefulWidget {
  final int? selected;
  final ValueChanged<int> onSelected;
  const StartTwoCardsRow(
      {super.key, required this.selected, required this.onSelected});

  @override
  State<StartTwoCardsRow> createState() => _StartTwoCardsRowState();
}

class _StartTwoCardsRowState extends State<StartTwoCardsRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => widget.onSelected(0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
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
                  shadows: widget.selected == 0
                      ? [
                          BoxShadow(
                              color: const Color(0xFFFFFFFF),
                              blurRadius: 18,
                              offset: Offset(0, 8))
                        ]
                      : [],
                ),
              ),
            ),
            Text('or',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Palette.artGold,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: GestureDetector(
                onTap: () => widget.onSelected(1),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
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
                    shadows: widget.selected == 1
                        ? [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 18,
                                offset: Offset(0, 8))
                          ]
                        : [],
                  ),
                ),
              ),
            ),
          ],
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: widget.selected != null
              ? Row(
                  key: ValueKey(widget.selected),
                  mainAxisAlignment: widget.selected == 0
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    if (widget.selected == 0)
                      Text('Artist',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: Palette.artGold)),
                    if (widget.selected == 1)
                      Text('User',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: Palette.artGold)),
                  ],
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
