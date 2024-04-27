import 'package:flutter/material.dart';
import 'package:shapes_formula/utils/show_answer_alert.dart';
import 'package:shapes_formula/widgets/button_hitung.dart';
import 'package:shapes_formula/widgets/rumus_text.dart';
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
  bool btnIsEnabled = false;
  final TextEditingController textFieldJariJariController =
      TextEditingController();

  // untuk dispose resource saat pembuatan objek
  @override
  void dispose() {
    textFieldJariJariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: RumusText(
          rumusLuas: 'phi * r * r',
          rumusKeliling: 'phi * d',
        )),

        const SizedBox(height: 20),

        // Row Textfield
        Center(
          child: CustomTextField(
            hintText: 'Masukan Nilai Jari - Jari (r)',
            unitText: 'Jari - Jari (r): ',
            textController: textFieldJariJariController,
            onChanged: (value) {
              setState(() {
                btnIsEnabled = textFieldJariJariController.text.isNotEmpty;
              });
            },
          ),
        ),
        const SizedBox(height: 20),

        // Button
        ButtonHitung(
          btnLuasOnPressed: (btnIsEnabled == true)
              ? () {
                  setState(() {
                    final luas = _hitungLuas(
                        double.parse(textFieldJariJariController.text));

                    showAnswerAlert(context,
                        'Radius: ${textFieldJariJariController.text}\nLuas Lingkaran: $luas');
                  });
                }
              : null,
          btnKelilingOnPressed: (btnIsEnabled == true)
              ? () {
                  setState(() {
                    final keliling = _hitungKeliling(
                        double.parse(textFieldJariJariController.text));

                    showAnswerAlert(context,
                        'Radius: ${textFieldJariJariController.text}\nKeliling Lingkaran: $keliling');
                  });
                }
              : null,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

double _hitungLuas(double jarijari) {
  const double phi = 3.14;
  final luas = phi * jarijari * jarijari;
  return luas;
}

double _hitungKeliling(double jarijari) {
  const double phi = 3.14;
  final keliling = phi * (2 * jarijari);
  return keliling;
}
