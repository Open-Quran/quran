import 'package:fabrikod_quran/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: kPaddingXL),
      child: const SizedBox(
        width: double.infinity,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: CancelIcon(),
            suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 20),
            border: InputBorder.none,
            hintText: 'Search surah, juz or ayahs...',
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.grey5,
            ),
          ),
          cursorColor: AppColors.white,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}

/// Cancel Icon on the right
class CancelIcon extends StatelessWidget {
  const CancelIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: SvgPicture.asset(
        ImageConstants.cancelIcon,
      ),
    );
  }
}
