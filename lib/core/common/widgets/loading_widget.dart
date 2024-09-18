import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoadingWidget extends StatefulWidget {
  final VoidCallback? event;
  const LoadingWidget({super.key, this.event});
  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (widget.event != null) {
          widget.event!();
        } else {
          return;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
