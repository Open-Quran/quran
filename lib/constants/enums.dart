/// App Bottom Navigation Bar Items
enum EBottomNavBarItems { home, more }

/// App Theme Modes
enum EThemeModes { light, dark, quran, green }

/// Language Modes
enum ESupportedLanguage { en, tr, ar }

/// Different types of quran
enum EQuranType { translation, reading }

/// Different types of reading
enum EReadOptions { surah, translation, surahAndTranslation }

/// Toggle button text styles
enum EToggleButtonTextStyle { selected, disabled }

/// Surah Detail screen Mode
enum ESurahDetailScreenMode { surah, juz }

/// Bookmarking verse or page
enum EBookMarkType { verse, page, surah }

/// Recent visited screen type
/// [ReadingScreen] or [TranslationScreen]
enum ERecentVisitedType { juz, page, surah }

/// Displaying Juz as list and grid
enum EJuzListType { list, grid }

/// Home switch toggle buttons
enum EJuzSurahToggleOptions { juz, surah }

/// Home switch toggle button between toggles and search bar
enum EToggleSearchOptions { toggles, searchField }

/// Show/Hide translation
enum ETranslationOptions { hide, show }

/// Reading alignment
enum ELayoutOptions { right, justify }

/// Different types of the Player State
enum EPlayerState { stop, playing, pause }

/// Download statuses for Verse Translations
enum EVerseTranslationState { download, downloading, downloaded }
