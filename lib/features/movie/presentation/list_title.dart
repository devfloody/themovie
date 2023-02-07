import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    Key? key,
    required this.title,
    required this.seeAll,
  }) : super(key: key);

  final String title;
  final VoidCallback seeAll;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppFont.plusJakartaBold.copyWith(fontSize: 20),
            ),
            OutlinedButton(
              onPressed: seeAll,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColor.secondary,
                ),
              ),
              child: Text(
                'See All',
                style: AppFont.plusJakartaMedium.copyWith(
                  fontSize: 12,
                  color: AppColor.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
