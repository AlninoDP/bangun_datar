import 'package:flutter/material.dart';

void showAnswerAlert(BuildContext context, String contentText) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Center(child: Text('Jawaban')),
      content: Text(contentText),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        )
      ],
    ),
  );
}
