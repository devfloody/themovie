import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import 'list_title.dart';
import 'movie_slider.dart';

class MovieView extends HookConsumerWidget {
  const MovieView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(
              'The Movie',
              style: AppFont.plusJakartaBold.copyWith(fontSize: 22, color: AppColor.secondary),
            ),
          ),
          ListTitle(title: "Now Playing", seeAll: () {}),
          const MovieSlider(),
          ListTitle(title: "Popular Movie", seeAll: () {}),
        ],
      ),
    );
  }
}
