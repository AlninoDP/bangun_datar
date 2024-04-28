import 'package:flutter/material.dart';
import 'package:shapes_formula/constant/constant.dart';
import 'package:shapes_formula/models/developer.dart';
import 'package:shapes_formula/pages/page_belah_ketupat.dart';
import 'package:shapes_formula/pages/page_jajar_genjang.dart';
import 'package:shapes_formula/pages/page_layang_layang.dart';
import 'package:shapes_formula/pages/page_lingkaran.dart';
import 'package:shapes_formula/pages/page_segitiga.dart';
import 'package:shapes_formula/pages/page_trapesium.dart';
import 'package:shapes_formula/widgets/dropdown_shape.dart';
import 'package:shapes_formula/widgets/profile_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Untuk mengganti bangun datar yang dipilih
  BangunDatar? _selectedShape;
  void _onDropDownChanged(BangunDatar? newSelectedShape) {
    setState(() {
      _selectedShape = newSelectedShape;
    });
  }

  // Untuk mengganti menu drawer
  bool isSwapped = false;
  void swapImages() {
    setState(() {
      isSwapped = !isSwapped;
    });
  }

  final List<Developer> _dev = [
    Developer(
      nama: 'Alnino Dio Putera',
      email: 'alninodp@gmail.com',
      nim: '20210801452',
      imgSrc: 'assets/images/dev_images/alnino.png',
    ),
    Developer(
      nama: 'Yoggy Montana Hendry',
      email: 'yoggymh26@gmail.com',
      nim: '20210801502',
      imgSrc: 'assets/images/dev_images/yoggy.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Rumus Bangun Datar'),
        centerTitle: true,
      ),

      // Drawer
      drawer: ProfileDrawer(
        positionLeftImage1: isSwapped ? 70 : -150,
        positionLeftImage2: isSwapped ? -150 : 70,
        imgSrc1: _dev[1].imgSrc,
        imgSrc2: _dev[0].imgSrc,
        title: _dev[isSwapped ? 1 : 0].nama,
        subtitle:
            '${_dev[isSwapped ? 1 : 0].email}\n${_dev[isSwapped ? 1 : 0].nim} - Teknik Informatika',
        onTap: () => swapImages(),
      ),

      // Body
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.png'),
              opacity: 0.07),
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Dropdown
              Center(
                child: DropdownShape(
                  selectedShape: _selectedShape,
                  onDropdownChanged: (newSelectedShape) =>
                      _onDropDownChanged(newSelectedShape),
                ),
              ),

              const SizedBox(height: 10),

              // Content Body
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: _selectedShape != null
                    ? _shapesFormulaMenu(_selectedShape)
                    : Column(children: [
                        const SizedBox(height: 100),
                        Image.asset(
                          'assets/images/app_icon.png',
                          width: 300,
                          height: 300,
                        ),
                      ]),
              ),
            ],
          ),
        )),
      ),
    ));
  }
}

/// Untuk menampilkan menu berdasarkan bangun datar
Widget _shapesFormulaMenu(BangunDatar? bangunDatar) {
  switch (bangunDatar) {
    case BangunDatar.lingkaran:
      return PageLingkaran(imagePath: _getShapesImagePath(bangunDatar));
    case BangunDatar.belahKetupat:
      return PageBelahKetupat(imagePath: _getShapesImagePath(bangunDatar));
    case BangunDatar.layangLayang:
      return PageLayangLayang(imagePath: _getShapesImagePath(bangunDatar));
    case BangunDatar.trapesium:
      return PageTrapesium(imagePath: _getShapesImagePath(bangunDatar));
    case BangunDatar.jajarGenjang:
      return PageJajarGenjang(imagePath: _getShapesImagePath(bangunDatar));
    case BangunDatar.segitiga:
      return PageSegitiga(imagePath: _getShapesImagePath(bangunDatar));

    default:
      return const Placeholder();
  }
}

/// Untuk set imagepath berdasarkan bangun datarnya
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
