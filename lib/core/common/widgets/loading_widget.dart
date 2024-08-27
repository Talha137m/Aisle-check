import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final VoidCallback event;
  const LoadingWidget({super.key, required this.event});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.event();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
