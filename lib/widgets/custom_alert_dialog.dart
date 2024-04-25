import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.contentText,
  });
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Jawaban')),
      content: Text(contentText),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        )
      ],
    );
  }
}
