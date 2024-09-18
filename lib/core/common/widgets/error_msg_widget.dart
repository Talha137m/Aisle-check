import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const ErrorMessageWidget({
    super.key,
    this.title = "Something Went Wrong",
    this.message = "Please try again!",
    this.onRetry,
  });
  static const double _padding = 16.0;
  static const double _iconSize = 60.0;
  static const double _gap = 20.0;
  static const double _titleFontSize = 24.0;
  static const double _desfontSize = 20.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: _iconSize,
            ),
            const SizedBox(height: _gap),
            Text(
              title,
              style: const TextStyle(
                fontSize: _titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: _gap),
            Text(
              message,
              style: const TextStyle(
                fontSize: _desfontSize,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: _gap),
            if (onRetry != null)
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
          ],
        ),
      ),
    );
  }
}
