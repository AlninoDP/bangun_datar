import 'package:flutter/material.dart';
import 'package:shapes_formula/constant/constant.dart';

class DropdownShape extends StatelessWidget {
  const DropdownShape({
    super.key,
    required this.onDropdownChanged,
    required this.selectedShape,
  });
  final ValueChanged<BangunDatar?> onDropdownChanged;
  final BangunDatar? selectedShape;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.black12),
      child: DropdownButton(
          underline: const SizedBox.shrink(),
          hint: const Text('Pilih Bangun Datar'),
          value: selectedShape,
          items: BangunDatar.values
              .map(
                (bangunDatar) => DropdownMenuItem<BangunDatar>(
                  value: bangunDatar,
                  child: Text(
                      bangunDatar.toString().split('.').last.toUpperCase()),
                ),
              )
              .toList(),
          onChanged: onDropdownChanged),
    );
  }
}
