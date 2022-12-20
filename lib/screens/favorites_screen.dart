import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/favorites_provider.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/verse_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/no_item_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: context.translate.favorites),
      body: buildBody,
    );
  }

  Widget get buildBody {
    List<VerseModel> favoriteVerses = context.watch<FavoritesProvider>().favoriteVerses;
    return favoriteVerses.isEmpty
        ? const NoItemWidget(
            text: "No Favorites Added",
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 50,
            ))
        : ListView.separated(
            itemCount: favoriteVerses.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(
              vertical: kPaddingXXL,
              horizontal: kPaddingXL,
            ),
            itemBuilder: (context, index) => VerseCard(
              verseModel: favoriteVerses.elementAt(index),
              isFavorite: true,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: kPaddingXL),
          );
  }
}
