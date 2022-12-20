import 'package:flutter/material.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF424242).withOpacity(0.26),
          borderRadius: BorderRadius.circular(10)),
      height: 140,
      child: Column(
        children: [
          Expanded(
            child: VerseCardAyat(
              numberOfAyat: '٣',
              ayat: 'ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ',
            ),
          ),
          Row(
            children: [
              Spacer(),
              SizedBox(
                width: 320,
                height: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xFF1D1D1D).withOpacity(0),
                      Color(0xFF353535).withOpacity(1)
                    ],
                  )),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                'In the Name of Allah—the Most Compassionate, Most Merciful.In the Name of Allah—the Most Compassionate, Most Merciful.',
                style: TextStyle(
                  color: Color(0xFFB4B4B4),
                  fontSize: 14,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VerseCardAyat extends StatelessWidget {
  VerseCardAyat({
    Key? key,
    required this.numberOfAyat,
    required this.ayat,
  }) : super(key: key);

  String numberOfAyat;
  String ayat;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Text(
            numberOfAyat,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF1D1D1D).withOpacity(0),
                  Color(0xFFE3BE92).withOpacity(0.24),
                ]),
                borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(8),
            child: Text(
              ayat,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
