import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/nav_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/features/home/presentation/widgets/dashboard_bar.dart';
import 'package:artemi_project/src/features/home/presentation/widgets/artists_carousel.dart';
import 'package:artemi_project/src/features/home/presentation/widgets/category_section.dart';
import 'package:artemi_project/src/features/home/presentation/widgets/search_artist_bar.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        bottomNavigationBar: NavBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              children: [
                DashboardBar(),
                SearchArtistBar(),
                CategorySection(),
                Divider(
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Trend Artists',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 20),
                      ),
                    ),
                    ArtistCardCarousel(),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
