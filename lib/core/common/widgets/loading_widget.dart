import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoadingWidget extends StatelessWidget {
  final VoidCallback? event;
  const LoadingWidget({super.key, this.event});
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (event != null) {
          event!();
        } else {
          log('message:null function is paased');
          return;
        }
      },
    );
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
