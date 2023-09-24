import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:math_app/screen/multiplaying_screen.dart';
import 'package:math_app/screen/tests_screen.dart';

class TheoryScreen extends StatelessWidget {
  const TheoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(234, 243, 241, 241),
      appBar: AppBar(
        title: Text('Temalar'),
        backgroundColor: Colors.blue,
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 1,
        itemCount: 8,

        // Toplamda 4 tema
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MultiplyingScreen()),
                );
              } else {
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestScreen()),
                  );
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: _getThemeColor(index),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _getThemeTitle(index),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.extent(1, 50),
        mainAxisSpacing: 2,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
      ),
    );
  }

  List<Color> getColorList(int elementSayisi) {
    List<Color> colors = [];
    for (int i = 0; i < elementSayisi; i++) {
      colors.add(_getThemeColor(i));
    }
    return colors;
  }

  Color _getThemeColor(int index) {
    List<Color> colors = [Colors.white];
    return colors[index % colors.length];
  }

  void main() {
    int elementSayisi = 100;
    List<Color> renklerListesi = getColorList(elementSayisi);

    // renklerListesi şimdi 100 tane element içeriyor ve renkler belirttiğiniz sırayla tekrarlanıyor.
  }

  String _getThemeTitle(int index) {
    if (index == 0) {
      return '    Köpeltmek';
    } else if (index == 1) {
      return '    Bölmekkk';
    } else if (index == 2) {
      return '    Goşmak';
    } else if (index == 3) {
      return '    Ayyrmak';
    } else if (index == 4) {
      return '    Ayyrmak';
    } else if (index == 5) {
      return '    Ayyrmak';
    } else if (index == 6) {
      return '    Ayyrmak';
    } else if (index == 7) {
      return '    Ayyrmak';
    }

    return '';
  }
}
