import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/ayat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.translate.favorites,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(ImageConstants.arrowBack),
        ),
      ),
      body: verseList,
    );
  }

  Widget get verseList {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: kPaddingVertical, horizontal: kPaddingHorizontal),
      itemBuilder: (context, index) => VerseCard(index: index),
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingHorizontal),
    );
  }
}
