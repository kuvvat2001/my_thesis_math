import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Tests'), // Sayfa başlığı
      ),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: [
          TestSection(

            title: 'Multiply in columns',
            color: Colors.white,
            subSections: ['yenil', 'orta', 'kyn'],
          ),
          TestSection(
            title: 'Another Test',
            color: Colors.white,
            subSections: ['yenil', 'orta', 'kyn'],
          ),
          TestSection(
            title: 'Another Test',
            color: Colors.white,
            subSections: ['yenil', 'orta', 'kyn'],
          ),
          TestSection(
            title: 'Another Test',
            color: Colors.white,
            subSections: ['yenil', 'orta', 'kyn'],
          ),
          // Diğer testleri burada ekleyin
        ],
      ),
    );
  }
}

class TestSection extends StatelessWidget {
  final String title;
  final Color color;
  final List<String> subSections;

  TestSection({required this.title, required this.color, required this.subSections});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TestDetailScreen(
                title: title,
                subSections: subSections,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title Test',
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
    );
  }
}

class TestDetailScreen extends StatelessWidget {
  final String title;
  final List<String> subSections;

  TestDetailScreen({required this.title, required this.subSections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bu test hakkında detaylar burada görüntülenir.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Testi başlatmak veya ilgili işlemi yapmak için buraya kod ekleyebilirsiniz.
              },
              child: Text('Testi Başlat'),
            ),
            SizedBox(height: 16),
            Text(
              'Alt Bölümler:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: subSections.map((subSection) {
                return ListTile(
                  title: Text(subSection),
                  onTap: () {
                    // Alt bölüme tıklama işlevi burada eklenir.
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
