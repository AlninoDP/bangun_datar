import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.unitText,
      required this.hintText,
      required this.textController,
      this.onChanged});
  final String hintText;
  final String unitText;
  final TextEditingController textController;
  final ValueChanged? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          unitText,
          style: const TextStyle(fontSize: 22),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: TextField(
              onChanged: onChanged,
              controller: textController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  hintText: hintText,
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
