import 'package:flutter/material.dart';

class RumusText extends StatelessWidget {
  const RumusText({
    super.key,
    required this.rumusLuas,
    required this.rumusKeliling,
  });
  final String rumusLuas;
  final String rumusKeliling;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text(
              'Luas',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Rumus: \t$rumusLuas',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        const VerticalDivider(
          thickness: 2,
        ),
        Column(
          children: [
            const Text(
              'Keliling',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Rumus: \t$rumusKeliling',
              style: const TextStyle(fontSize: 15),
            )
          ],
        ),
      ],
    );
  }
}
