import 'package:flutter/material.dart';
import 'package:shapes_formula/utils/show_answer_alert.dart';
import 'package:shapes_formula/widgets/button_hitung.dart';
import 'package:shapes_formula/widgets/rumus_text.dart';
import 'package:shapes_formula/widgets/custom_textfield.dart';

class PageTrapesium extends StatefulWidget {
  const PageTrapesium({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  State<PageTrapesium> createState() => _PageTrapesiumState();
}

class _PageTrapesiumState extends State<PageTrapesium> {
  bool btnLuasIsEnabled = false;
  bool btnKelilingIsEnabled = false;
  final TextEditingController textFieldAController = TextEditingController();
  final TextEditingController textFieldBController = TextEditingController();
  final TextEditingController textFieldCController = TextEditingController();
  final TextEditingController textFieldDController = TextEditingController();
  final TextEditingController textFieldHController = TextEditingController();
  // untuk dispose resource saat widget tidak di tampilkan
  @override
  void dispose() {
    textFieldAController.dispose();
    textFieldBController.dispose();
    textFieldCController.dispose();
    textFieldDController.dispose();
    textFieldHController.dispose();
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
          rumusLuas: '(a + b) * h / 2',
          rumusKeliling: 'a + b + c + d',
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

        // Row Textfield a
        Center(
          child: CustomTextField(
            unitText: 'Sisi Sejajar (a): ',
            hintText: 'Masukan Nilai Alas (a)',
            textController: textFieldAController,
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield b
        Center(
          child: CustomTextField(
            unitText: 'Sisi Sejajar (b): ',
            hintText: 'Masukan Nilai Alas (b)',
            textController: textFieldBController,
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield h
        Center(
          child: CustomTextField(
            unitText: 'Tinggi (h): ',
            hintText: 'Masukan Nilai Tinggi (h)',
            textController: textFieldHController,
            onChanged: (value) {
              setState(() {
                btnLuasIsEnabled = textFieldAController.text.isNotEmpty &&
                    textFieldBController.text.isNotEmpty &&
                    textFieldHController.text.isNotEmpty;
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

        // Row Textfield Sisi c
        Center(
          child: CustomTextField(
            unitText: 'Sisi (c): ',
            hintText: 'Masukan Nilai Sisi (c)',
            textController: textFieldCController,
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield Sisi b
        Center(
          child: CustomTextField(
            unitText: 'Sisi (d): ',
            hintText: 'Masukan Nilai Sisi (d)',
            textController: textFieldDController,
            onChanged: (value) {
              setState(() {
                btnKelilingIsEnabled = textFieldAController.text.isNotEmpty &&
                    textFieldBController.text.isNotEmpty &&
                    textFieldCController.text.isNotEmpty &&
                    textFieldDController.text.isNotEmpty;
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
                    final nilaiAlasA = double.parse(textFieldAController.text);
                    final nilaiAlasB = double.parse(textFieldBController.text);
                    final nilaiTinggi = double.parse(textFieldHController.text);
                    final luas =
                        _hitungLuas(nilaiAlasA, nilaiAlasB, nilaiTinggi);

                    showAnswerAlert(
                      context,
                      '''
Alas (a): $nilaiAlasA
Alas (b): $nilaiAlasB
Tinggi (h): $nilaiTinggi
Luas Trapesium: $luas''',
                    );
                  });
                }
              : null,
          btnKelilingOnPressed: (btnKelilingIsEnabled == true)
              ? () {
                  setState(() {
                    final nilaiAlasA = double.parse(textFieldAController.text);
                    final nilaiAlasB = double.parse(textFieldBController.text);
                    final nilaiSisiC = double.parse(textFieldCController.text);
                    final nilaiSisiD = double.parse(textFieldDController.text);

                    final keliling = _hitungKeliling(
                        nilaiAlasA, nilaiAlasB, nilaiSisiC, nilaiSisiD);

                    showAnswerAlert(
                      context,
                      '''
Alas (a): $nilaiAlasA
Alas (b): $nilaiAlasB
Sisi (c): $nilaiSisiC
Sisi (d): $nilaiSisiD 
Keliling Trapesium: $keliling''',
                    );
                  });
                }
              : null,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}

double _hitungLuas(double alasA, double alasB, double tinggi) {
  final luas = (alasA + alasB) * tinggi / 2;
  return luas;
}

double _hitungKeliling(double a, double b, double c, double d) {
  final keliling = (a + b + c + d);
  return keliling;
}
