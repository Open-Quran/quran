import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_button.dart';
import 'package:fabrikod_quran/widgets/buttons/custom_toggle_buttons.dart';
import 'package:fabrikod_quran/widgets/cards/juz_card.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  /// Page [index] => initially defaulted to the [0]
  int pageIndex = 0;

  /// Changing the [pageIndex]
  changeCurrentState(int index) {
    setState(() => pageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingVertical,
          horizontal: kPaddingHorizontal,
        ),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: context.theme.dividerColor),
          ),
        ),
        child: Column(
          children: [
            buildToggleButton,
            const SizedBox(height: kPaddingHorizontal),
            Expanded(child: body)
          ],
        ),
      ),
    );
  }

  Widget get buildToggleButton {
    return CustomToggleButtons(
      buttonTitles: [
        context.translate.surah,
        context.translate.juz,
        context.translate.sajda,
      ],
      selectedIndex: pageIndex,
      onTap: changeCurrentState,
    );
  }

  Widget get body {
    return IndexedStack(
      index: pageIndex,
      children: [
        buildSurah,
        buildJuz,
        buildSajda,
      ],
    );
  }

  Widget get buildSurah {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CustomButton(
                title: context.translate.searchSurah,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: 45,
                  itemBuilder: (context, index) {
                    return CustomButton(
                      title: "$index  Al-Fatihah",
                      state: index == 2,
                      centerTitle: false,
                      height: 45,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: context.theme.dividerColor,
          width: kPaddingHorizontal * 2,
          thickness: 2,
        ),
        Expanded(
          child: Column(
            children: [
              CustomButton(
                title: context.translate.ayat,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: 45,
                  itemBuilder: (context, index) {
                    return CustomButton(
                      title: "$index",
                      state: index == 5,
                      centerTitle: false,
                      height: 45,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get buildJuz {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: kPaddingDefault * 2,
        crossAxisSpacing: kPaddingDefault * 2,
      ),
      itemBuilder: (context, index) => JuzCard(
        index: index + 1,
        onTap: (selectedJuzIndex) {},
      ),
    );
  }

  Widget get buildSajda {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CustomButton(
                title: context.translate.searchSurah,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CustomButton(
                      title: "$index  Al-Fatihah",
                      state: index == 2,
                      centerTitle: false,
                      height: 45,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          color: context.theme.dividerColor,
          width: kPaddingHorizontal * 2,
          thickness: 2,
        ),
        Expanded(
          child: Column(
            children: [
              CustomButton(
                title: context.translate.ayat,
                centerTitle: false,
                textOpacity: 0.5,
                height: 45,
              ),
              const SizedBox(height: kPaddingDefault),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CustomButton(
                      title: "$index",
                      state: index == 1,
                      centerTitle: false,
                      height: 45,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
