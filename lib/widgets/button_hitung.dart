import 'package:flutter/material.dart';

class ButtonHitung extends StatelessWidget {
  const ButtonHitung({
    super.key,
    this.btnLuasOnPressed,
    this.btnKelilingOnPressed,
  });
  final Function()? btnLuasOnPressed;
  final Function()? btnKelilingOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: btnLuasOnPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Hitung Luas'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: btnKelilingOnPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Hitung Keliling'),
        ),
      ],
    );
  }
}
