import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:math_app/screen/books_scrren.dart';
import 'package:math_app/screen/results_screen.dart';
import 'package:math_app/screen/statistic_screen.dart';
import 'package:math_app/screen/tests_ui_screeen.dart';
import 'package:math_app/screen/theory_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Matematika"),
          backgroundColor: Colors.blue,
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 16.0,
          padding: const EdgeInsets.only(top: 25,left: 16,right: 16,bottom: 16),
          staggeredTiles: const [
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(1, 150),
            StaggeredTile.extent(2, 150),
          ],
          children: [
            _buildMenuItem(context,"Sapaklar",Icons.book,Colors.greenAccent,const TheoryScreen()),
            _buildMenuItem(context,"Testler",Icons.assignment,Colors.blueAccent,const TestsUiScreen()),_buildMenuItem(context,"Satistikalar",Icons.bar_chart,Colors.redAccent,const StatisticScreen()),_buildMenuItem(context,"Netijeler",Icons.poll,Colors.amber,const ResultsScreen()),
            _buildMenuItem(context,"Kitaplar",Icons.menu_book_rounded,Colors.deepPurple,const BooksScreen()),
          ],
        ),
        );
  }
}

Widget _buildMenuItem(BuildContext context, String title, IconData icon,
    Color color, Widget screen) {
  return GestureDetector(
    onTap: () {
      // haysyna bassan ekerani ac
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    },
    child: Container(padding:  const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.grey,
    ),
    child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Icon(icon,size: 60,color: color),
        Text(title,style: const TextStyle(color: Colors.white,fontSize: 18),
        ),
      ],
    ),
    ),
  );
}
