import 'package:flutter/cupertino.dart';

class ItemScaleAnimation extends StatefulWidget {
  const ItemScaleAnimation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ItemScaleAnimation> createState() => _ItemScaleAnimationState();
}

class _ItemScaleAnimationState extends State<ItemScaleAnimation>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }

  @override
  bool get wantKeepAlive => false;
}
