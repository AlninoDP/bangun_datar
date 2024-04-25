import 'package:flutter/material.dart';
import 'package:shapes_formula/utils/show_answer_alert.dart';
import 'package:shapes_formula/widgets/button_hitung.dart';
import 'package:shapes_formula/widgets/custom_rumus_text.dart';
import 'package:shapes_formula/widgets/custom_textfield.dart';

class PageLingkaran extends StatefulWidget {
  const PageLingkaran({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  State<PageLingkaran> createState() => _PageLingkaranState();
}

class _PageLingkaranState extends State<PageLingkaran> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldJariJariController =
        TextEditingController();
    return Column(
      children: [
        // Image
        Image.asset(
          widget.imagePath,
          width: 250,
          height: 250,
        ),

        // Row Rumus
        const IntrinsicHeight(
            child: CustomRumusText(
          rumusLuas: 'phi * r * r',
          rumusKeliling: 'phi * d',
        )),
        const SizedBox(
          height: 20,
        ),

        // Row Textfield
        Center(
          child: CustomTextField(
            hintText: 'Masukan Nilai Jari - Jari (r)',
            unitText: 'Jari - Jari (r): ',
            textController: textFieldJariJariController,
          ),
        ),
        const SizedBox(height: 20),

        // Button
        //TODO: VALIDATOR TEXTFIELD
        ButtonHitung(
          btnLuasOnPressed: () {
            setState(() {
              // textFieldJariJariController.value.text.isNotEmpty
              final String luas =
                  _hitungLuas(double.parse(textFieldJariJariController.text))
                      .toString();
              showAnswerAlert(context,
                  'Radius: ${textFieldJariJariController.text}\nLuas Lingkaran: $luas');
            });
          },
        )
      ],
    );
  }
}

double _hitungLuas(double jarijari) {
  const double phi = 3.14;
  final luas = phi * jarijari * jarijari;
  return luas;
}
