import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';
import 'package:fabrikod_quran/providers/bookmark_provider.dart';
import 'package:fabrikod_quran/widgets/app_bars/main_app_bar.dart';
import 'package:fabrikod_quran/widgets/cards/verse_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: context.translate.bookmark),
      body: buildBody,
    );
  }

  Widget get buildBody {
    List<VerseModel> bookmarkVerses = context.watch<BookMarkProvider>().bookmarkVerses;
    return ListView.separated(
      itemCount: bookmarkVerses.length,
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(
        vertical: kPaddingVertical,
        horizontal: kPaddingHorizontal,
      ),
      itemBuilder: (context, index) => VerseCard(verseModel: bookmarkVerses.elementAt(index)),
      separatorBuilder: (context, index) => const SizedBox(height: kPaddingHorizontal),
    );
  }
}
