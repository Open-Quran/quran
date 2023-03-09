import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:the_open_quran/constants/constants.dart';

import '../models/verse_model.dart';
import '../providers/favorites_provider.dart';
import '../widgets/app_bars/primary_app_bar.dart';
import '../widgets/cards/favorite_card.dart';
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
      appBar: PrimaryAppBar(title: context.translate.theOpenQuran),
      body: buildBody,
    );
  }

  Widget get buildBody {
    List<VerseModel> favoriteVerses =
        context.watch<FavoritesProvider>().favoriteVerses;
    return favoriteVerses.isEmpty
        ? NoItemWidget(
            text: context.translate.noFavoritesAdded,
            icon: SvgPicture.asset(ImageConstants.favoriteInactiveIcon,
                width: 55, height: 50),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kSizeXL, vertical: kSizeL),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.translate.favorites,
                      style: context.theme.textTheme.displayLarge,
                    ),
                  ),
                  ListView.separated(
                    itemCount: favoriteVerses.length,
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.symmetric(
                      vertical: kSizeL,
                    ),
                    itemBuilder: (context, item) => FavoriteCard(
                      onTap: () =>
                          context.read<FavoritesProvider>().onTapFavoriteCard(
                                context,
                                favoriteVerses.elementAt(item),
                              ),
                      verseModel: favoriteVerses.elementAt(item),
                    ),
                    separatorBuilder: (context, item) =>
                        const SizedBox(height: kSizeXL),
                  ),
                ],
              ),
            ),
          );
  }
}
