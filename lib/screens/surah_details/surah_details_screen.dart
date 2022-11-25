import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/providers/quran_provider.dart';
import 'package:fabrikod_quran/providers/surah_details_provider.dart';
import 'package:fabrikod_quran/screens/surah_details/reading_screen.dart';
import 'package:fabrikod_quran/screens/surah_details/translation_screen.dart';
import 'package:fabrikod_quran/widgets/bottom_sheets/quran_style_bottom_sheet.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer.dart';
import 'package:fabrikod_quran/widgets/drawer/custom_drawer_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SurahDetailsProvider>().initAfterScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDrawerScaffold(
      appBarTitle: context.watch<SurahDetailsProvider>().appBarTitle,
      drawer: const CustomDrawer(),
      onTapMore: () => QuranStyleBottomSheet.show(context),
      body: buildBody,
    );
  }

  Widget get buildBody {
    return Column(
      children: [
        buildTranslationOrReadingSwitch,
        Expanded(child: buildTranslationOrReading),
      ],
    );
  }

  /// Switch [translation] or [reading]
  Widget get buildTranslationOrReadingSwitch {
    return Visibility(
      visible: !context.watch<SurahDetailsProvider>().readingSettings.isReadingMode,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: kPaddingVertical, horizontal: kPaddingHorizontal),
        child: CustomToggleButtons(
          buttonTitles: [
            context.translate.translation,
            context.translate.reading,
          ],
          selectedIndex: context.watch<QuranProvider>().localSetting.quranType.index,
          onTap: context.read<SurahDetailsProvider>().changeQuranType,
        ),
      ),
    );
  }

  /// Switch toggles
  /// [EQuranType.translation] and [EQuranType.reading]
  Widget get buildTranslationOrReading {
    return IndexedStack(
      index: context.watch<QuranProvider>().localSetting.quranType.index,
      children: const [
        TranslationScreen(),
        ReadingScreen(),
      ],
    );
  }
}
