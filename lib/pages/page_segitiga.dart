import 'package:flutter/material.dart';
import 'package:shapes_formula/utils/show_answer_alert.dart';
import 'package:shapes_formula/widgets/button_hitung.dart';
import 'package:shapes_formula/widgets/rumus_text.dart';
import 'package:shapes_formula/widgets/custom_textfield.dart';

class PageSegitiga extends StatefulWidget {
  const PageSegitiga({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  State<PageSegitiga> createState() => _PageSegitigaState();
}

class _PageSegitigaState extends State<PageSegitiga> {
  bool btnLuasIsEnabled = false;
  bool btnKelilingIsEnabled = false;
  final TextEditingController textFieldAlasController = TextEditingController();
  final TextEditingController textFieldTinggiController =
      TextEditingController();
  final TextEditingController textFieldSisiAController =
      TextEditingController();
  final TextEditingController textFieldSisiCController =
      TextEditingController();
  // untuk dispose resource saat widget tidak di tampilkan
  @override
  void dispose() {
    textFieldAlasController.dispose();
    textFieldTinggiController.dispose();
    textFieldSisiAController.dispose();
    textFieldSisiCController.dispose();
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
          rumusLuas: 'b * h / 2',
          rumusKeliling: 'a + b + c',
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

        // Row Textfield Alas
        Center(
          child: CustomTextField(
            unitText: 'Alas (b): ',
            hintText: 'Masukan Nilai (b)',
            textController: textFieldAlasController,
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield Tinggi
        Center(
          child: CustomTextField(
            unitText: 'Tinggi (hb): ',
            hintText: 'Masukan Nilai (hb)',
            textController: textFieldTinggiController,
            onChanged: (value) {
              setState(() {
                btnLuasIsEnabled = textFieldAlasController.text.isNotEmpty &&
                    textFieldTinggiController.text.isNotEmpty;
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

        // Row Textfield Sisi a
        Center(
          child: CustomTextField(
            unitText: 'Sisi (a): ',
            hintText: 'Masukan Nilai Sisi (a)',
            textController: textFieldSisiAController,
          ),
        ),
        const SizedBox(height: 20),

        // Row Textfield Sisi c
        Center(
          child: CustomTextField(
            unitText: 'Sisi (c): ',
            hintText: 'Masukan Nilai Sisi (c)',
            textController: textFieldSisiCController,
            onChanged: (value) {
              setState(() {
                btnKelilingIsEnabled =
                    textFieldAlasController.text.isNotEmpty &&
                        textFieldSisiAController.text.isNotEmpty &&
                        textFieldSisiCController.text.isNotEmpty;
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
                    final nilaiAlas =
                        double.parse(textFieldAlasController.text);
                    final nilaiTinggi =
                        double.parse(textFieldTinggiController.text);
                    final luas = _hitungLuas(nilaiAlas, nilaiTinggi);

                    showAnswerAlert(
                      context,
                      '''
Alas: $nilaiAlas
Tinggi: $nilaiTinggi
Luas Segitiga: $luas''',
                    );
                  });
                }
              : null,
          btnKelilingOnPressed: (btnKelilingIsEnabled == true)
              ? () {
                  setState(() {
                    final nilaiSisiA =
                        double.parse(textFieldSisiAController.text);
                    final nilaiAlas =
                        double.parse(textFieldAlasController.text);

                    final nilaiSisiC =
                        double.parse(textFieldSisiCController.text);

                    final keliling =
                        _hitungKeliling(nilaiSisiA, nilaiAlas, nilaiSisiC);

                    showAnswerAlert(
                      context,
                      """
Sisi a: $nilaiSisiA
Alas b: $nilaiAlas
Sisi c: $nilaiSisiC
Keliling Segitiga: $keliling""",
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

double _hitungLuas(double alas, double tinggi) {
  final luas = alas * tinggi / 2;
  return luas;
}

double _hitungKeliling(double sisiA, double alas, double sisiC) {
  final keliling = sisiA + alas + sisiC;
  return keliling;
}
