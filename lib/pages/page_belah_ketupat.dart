import 'package:flutter/material.dart';
import 'package:shapes_formula/utils/show_answer_alert.dart';
import 'package:shapes_formula/widgets/button_hitung.dart';
import 'package:shapes_formula/widgets/rumus_text.dart';
import 'package:shapes_formula/widgets/custom_textfield.dart';

class PageBelahKetupat extends StatefulWidget {
  const PageBelahKetupat({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  State<PageBelahKetupat> createState() => _PageBelahKetupatState();
}

class _PageBelahKetupatState extends State<PageBelahKetupat> {
  bool btnLuasIsEnabled = false;
  bool btnKelilingIsEnabled = false;
  final TextEditingController textFieldD1Controller = TextEditingController();
  final TextEditingController textFieldD2Controller = TextEditingController();
  final TextEditingController textFieldSisiController = TextEditingController();

  // untuk dispose resource saat widget tidak di tampilkan
  @override
  void dispose() {
    textFieldD1Controller.dispose();
    textFieldD2Controller.dispose();
    textFieldSisiController.dispose();
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
          rumusLuas: 'p * q / 2',
          rumusKeliling: '4 * a',
        )),

        // Divider
        const SizedBox(height: 20),
        const Divider(),
        const Center(
          child: Text(
            'LUAS',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield D1
        Center(
          child: CustomTextField(
            unitText: 'Diagonal 1 (p): ',
            hintText: 'Masukan Nilai D1 (p)',
            textController: textFieldD1Controller,
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield D2
        Center(
          child: CustomTextField(
            unitText: 'Diagonal 2 (q): ',
            hintText: 'Masukan Nilai D2 (q)',
            textController: textFieldD2Controller,
            onChanged: (value) {
              setState(() {
                btnLuasIsEnabled = textFieldD2Controller.text.isNotEmpty &&
                    textFieldD1Controller.text.isNotEmpty;
              });
            },
          ),
        ),

        // Divider
        const SizedBox(height: 20),
        const Divider(),
        const Center(
          child: Text(
            'KELILING',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield Sisi
        Center(
          child: CustomTextField(
            unitText: 'Sisi (a): ',
            hintText: 'Masukan Nilai Sisi (a)',
            textController: textFieldSisiController,
            onChanged: (value) {
              setState(() {
                btnKelilingIsEnabled = textFieldSisiController.text.isNotEmpty;
              });
            },
          ),
        ),
        const SizedBox(height: 20),

        // Button
        ButtonHitung(
          btnLuasOnPressed: (btnLuasIsEnabled == true)
              ? () {
                  setState(() {
                    final nilaiD1 = double.parse(textFieldD1Controller.text);
                    final nilaiD2 = double.parse(textFieldD2Controller.text);
                    final luas = _hitungLuas(nilaiD1, nilaiD2);

                    showAnswerAlert(
                      context,
                      '''
Diagonal 1: ${textFieldD1Controller.text}
Diagonal 2: ${textFieldD2Controller.text}
Luas Belah Ketupat: $luas''',
                    );
                  });
                }
              : null,
          btnKelilingOnPressed: (btnKelilingIsEnabled == true)
              ? () {
                  setState(() {
                    final nilaiSisi =
                        double.parse(textFieldSisiController.text);

                    final keliling = _hitungKeliling(nilaiSisi);

                    showAnswerAlert(context,
                        'Sisi: ${textFieldSisiController.text}\nKeliling Belah Ketupat: $keliling');
                  });
                }
              : null,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}

double _hitungLuas(double d1, double d2) {
  final luas = d1 * d2 / 2;
  return luas;
}

double _hitungKeliling(double sisi) {
  final keliling = 4 * sisi;
  return keliling;
}
