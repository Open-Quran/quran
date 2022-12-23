import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/favorites_provider.dart';
import 'package:fabrikod_quran/widgets/cards/favorites_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_bars/primary_app_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: context.translate.theOpenQuran),
      body: buildBody,
    );
  }

  Widget get buildBody {
    List<VerseModel> favoriteVerses =
        context.watch<FavoritesProvider>().favoriteVerses;
    // return favoriteVerses.isEmpty
    //     ? const NoItemWidget(
    //         text: "No Favorites Added",
    //         icon: Icon(
    //           Icons.favorite_border_outlined,
    //           size: 50,
    //           color: AppColors.grey,
    //         ))
    //     :
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(kPaddingXL, kPaddingL, 0, 0),
            child: Text(
              'Favorites',
              style: context.theme.textTheme.displayLarge,
            ),
          ),
          ListView.separated(
            itemCount: 10, //favoriteVerses.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(
              vertical: kPaddingL,
              horizontal: kPaddingXL,
            ),
            itemBuilder: (context, index) => const FavoritesCard(
              surahName: 'Al - Fatihah',
              surahNameTranslation: 'The Opener',
              pageNumber: 254,
            ),
            separatorBuilder: (context, index) =>
                const SizedBox(height: kPaddingXL),
          ),
        ],
      ),
    );
  }
}
