import 'package:flutter/material.dart';

class FadeAndSlideAnimation extends StatelessWidget {
  const FadeAndSlideAnimation(
      {super.key,
      required this.fadeAnimation,
      required this.child,
      required this.slideAnimation});
  final Animation<double> fadeAnimation;
  final Widget child;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(position: slideAnimation, child: child));
  }
}
