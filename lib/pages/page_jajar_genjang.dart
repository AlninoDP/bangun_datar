import 'package:flutter/material.dart';
import 'package:shapes_formula/utils/show_answer_alert.dart';
import 'package:shapes_formula/widgets/button_hitung.dart';
import 'package:shapes_formula/widgets/rumus_text.dart';
import 'package:shapes_formula/widgets/custom_textfield.dart';

class PageJajarGenjang extends StatefulWidget {
  const PageJajarGenjang({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  State<PageJajarGenjang> createState() => _PageJajarGenjangState();
}

class _PageJajarGenjangState extends State<PageJajarGenjang> {
  bool btnLuasIsEnabled = false;
  bool btnKelilingIsEnabled = false;
  final TextEditingController textFieldAlasController = TextEditingController();
  final TextEditingController textFieldTinggiController =
      TextEditingController();
  final TextEditingController textFieldSisiController = TextEditingController();

  // untuk dispose resource saat widget tidak di tampilkan
  @override
  void dispose() {
    textFieldAlasController.dispose();
    textFieldTinggiController.dispose();
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
          rumusLuas: 'b * h',
          rumusKeliling: '2 (a + b)',
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

        // Row Textfield b
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
            unitText: 'Tinggi (h): ',
            hintText: 'Masukan Nilai (h)',
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

        // Row Textfield Sisi
        Center(
          child: CustomTextField(
            unitText: 'Sisi (a): ',
            hintText: 'Masukan Nilai Sisi (a)',
            textController: textFieldSisiController,
            onChanged: (value) {
              setState(() {
                btnKelilingIsEnabled =
                    textFieldAlasController.text.isNotEmpty &&
                        textFieldSisiController.text.isNotEmpty;
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
Luas Jajar Genjang: $luas''',
                    );
                  });
                }
              : null,
          btnKelilingOnPressed: (btnKelilingIsEnabled == true)
              ? () {
                  setState(() {
                    final nilaiAlas =
                        double.parse(textFieldAlasController.text);
                    final nilaiSisi =
                        double.parse(textFieldSisiController.text);

                    final keliling = _hitungKeliling(nilaiSisi, nilaiAlas);

                    showAnswerAlert(
                      context,
                      '''
Sisi: $nilaiAlas
Alas: $nilaiSisi
Keliling Jajar Genjang: $keliling''',
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
  final luas = alas * tinggi;
  return luas;
}

double _hitungKeliling(double sisi, double alas) {
  final keliling = 2 * (sisi + alas);
  return keliling;
}
