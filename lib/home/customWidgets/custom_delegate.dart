import 'package:flutter/material.dart';

class CustomAutoHideAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomAutoHideAppBarDelegate({
    @required this.child,
  });

  final Widget? child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    return SizedBox(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: DefaultTextStyle.merge(
            style: theme.primaryTextTheme.subtitle1,
            child: IconTheme.merge(
              data: theme.primaryIconTheme,
              child: child!,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  bool shouldRebuild(CustomAutoHideAppBarDelegate oldDelegate) =>
      child != oldDelegate.child;
}
