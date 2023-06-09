import 'package:flutter/material.dart';
import 'package:tamakan/View/surah_view.dart';

class QuranView extends StatefulWidget {
  QuranView({super.key, required this.childID});

  final String childID;

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  final List<String> surahs = [
    'الفاتحة',
    'الإخلاص',
    'الفلق',
    "الناس",
    'الكوثر'
  ];

  List<Color> surahsColor = const [
    Color(0xff1A535C),
    Color(0xff4ECDC4),
    Color(0xffA4D173),
    Color(0xffFFD474),
  ];

  //   Color(0xff4ECDC4),
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //appbar needed?
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Image.asset(
              'assets/images/logo3.png',
              scale: 0.5,
            ),
          ],
          backgroundColor: const Color(0xffFF6B6B),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                'القرآن الكريم',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'قصار السور',
                style: TextStyle(fontSize: 25, color: Colors.grey[700]),
              ),
            ),
            Expanded(
              child: ListView(
                children: surahs
                    .map(
                      (e) => Card(
                        color: surahsColor[colorIndex++ % 4],
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 80,
                            child: Center(
                                child: Text(
                              e,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SurahView(
                                surahName: e,
                                childID: widget.childID,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
