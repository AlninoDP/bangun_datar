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

  int _currentDrawerPageIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  final List<Developer> _dev = [
    Developer(
      nama: 'Alnino Dio Putera',
      email: 'alninodp@gmail.com',
      nim: '20210801452',
      imgSrc: 'assets/images/dev_images/alnino.png',
    ),
    Developer(
      nama: 'Yoggy Montana Hendry',
      email: 'johnDoe@gmail.com',
      nim: '20210801502',
      imgSrc: 'assets/images/dev_images/placeholder.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Rumus Bangun Datar'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: _dev.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Transform.translate(
                      offset: Offset(
                          _currentDrawerPageIndex == index
                              ? 0
                              : (_currentDrawerPageIndex > index
                                  ? -200.0
                                  : 200.0),
                          0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(_dev[index].imgSrc),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: UserAccountsDrawerHeader(
                          accountName: Text(_dev[index].nama),
                          accountEmail: Text(_dev[index].email),
                          currentAccountPicture: SizedBox(),
                          decoration: BoxDecoration(color: Colors.transparent),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                  : const SizedBox(),
            ),
          ],
        ),
      )),
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
