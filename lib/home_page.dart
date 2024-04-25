import 'package:flutter/material.dart';
import 'package:shapes_formula/constant/constant.dart';
import 'package:shapes_formula/pages/page_lingkaran.dart';
import 'package:shapes_formula/widgets/custom_alert_dialog.dart';
import 'package:shapes_formula/widgets/dropdown_shape.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BangunDatar? _selectedShape;

  void _onDropDownChanged(BangunDatar? newSelectedShape) {
    setState(() {
      _selectedShape = newSelectedShape;
    });
  }

  TextEditingController textFieldJariJari = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Rumus Bangun Datar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: DropdownShape(
                selectedShape: _selectedShape,
                onDropdownChanged: (newSelectedShape) =>
                    _onDropDownChanged(newSelectedShape),
              ),
            ),
            _selectedShape != null
                ? _shapesFormulaMenu(_selectedShape, context)
                : const Placeholder()
          ],
        ),
      )),
    ));
  }
}

Widget _shapesFormulaMenu(BangunDatar? bangunDatar, BuildContext context) {
  switch (bangunDatar) {
    case BangunDatar.lingkaran:
      return PageLingkaran(imagePath: _getShapesImagePath(bangunDatar));
    case BangunDatar.belahKetupat:
      return Placeholder();
    case BangunDatar.layangLayang:
      return Placeholder();
    case BangunDatar.trapesium:
      return Placeholder();
    case BangunDatar.jajarGenjang:
      return Placeholder();
    case BangunDatar.segitiga:
      return Placeholder();

    default:
      return const Placeholder();
  }
}

/// to set image asset path based on dropdown value
String _getShapesImagePath(BangunDatar? bangunDatar) {
  const basePath = 'assets/images';
  switch (bangunDatar) {
    case BangunDatar.lingkaran:
      return '$basePath/lingkaran.png';
    case BangunDatar.belahKetupat:
      return '$basePath/belah_ketupat.png';
    case BangunDatar.layangLayang:
      return '$basePath/layang_layang.png';
    case BangunDatar.trapesium:
      return '$basePath/trapesium.png';
    case BangunDatar.jajarGenjang:
      return '$basePath/jajar_genjang.png';
    case BangunDatar.segitiga:
      return '$basePath/segitiga.png';

    default:
      return '';
  }
}

void _showAnswer(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => CustomAlertDialog(contentText: 'Test'),
  );
}
