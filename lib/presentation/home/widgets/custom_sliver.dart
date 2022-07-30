import 'package:flutter/material.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  CustomSliverDelegate({
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => maxHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
