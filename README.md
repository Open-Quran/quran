<br />
<p align="center">
<img width="215" src="https://github.com/fabrikod/the-open-quran/blob/main/assets/images/logo_pic.png?raw=true">
</p>
<br />

<br />
<p align="center">
<img width="215" src="https://github.com/fabrikod/the-open-quran/blob/develop/assets/images/Juz%20Grid.png?raw=true">
<img width="215" src="https://github.com/fabrikod/the-open-quran/blob/develop/assets/images/Translation%20-%20Audio%20Player.png?raw=true">
<img width="215" src="https://github.com/fabrikod/the-open-quran/blob/develop/assets/images/Juz%20List.png?raw=true">
</p>
<br />


# The Open Qur'an - Mobile App

A demonstration app for Flutter that targets iOS, Android and shows how it can give a fantastic cross-platform experience.
The Open Qur'an App was carefully built by [fabrikod](https://fabrikod.com) to take into account user expectations, input methods, and idioms for each platform, guaranteeing it is comfortable on all of them. 


### About Fabrikod

<br />
<p align="center">
<img width="215" src="https://www.fabrikod.com/logo.jpg">
</p>
<br />

We are a company that creates cutting-edge digital experiences for savvy customers, and we like how simple Flutter simplifies that process.
Please [visit our website](https://fabrikod.com) to discover more about what we do.
Please get in touch with us! 

<p align="center"><img src="https://flutter.gskinner.com/folio/assets/images/git_dashes.png?" width="800px"></p>

### App Downloads

To try the app you can download it from your favorite app store:
* [Google Play](https://play.google.com)
* [Apple App Store](https://appstore.com)

### Installation

If you're new to Flutter the first thing you'll need is to follow the [setup instructions](https://flutter.dev/docs/get-started/install). 

Once Flutter is setup, you can use the latest `stable` channel:
 * Run `flutter channel stable`
 * Run `flutter upgrade`

Once you're on `dev` and desktop is enabled, you're ready to run the app:
* `flutter run -d windows`
* `flutter run -d macos`
* `flutter run -d linux`
* `flutter run -d android`
* `flutter run -d ios`
* `flutter run -d web`

If you re-start your IDE, you should also see a new launch option for your current desktop platform.

### File Structure

A High-level overview of the project structure:
```

lib/                     # Root Package
|
├─ constants/            # All app constants
├─ database/             # Local app database (shared pref) 
├─ handlers/             # Audio Handler
├─ l10n/                 # Localization
├─ models/               # Models for handling data    
├─ providers/            # Manages app state
├─ screens/              # App screens
│  ├─ surah_details/     # Views for different components
|
├─ services/             # Services 
├─ themes/               # App themes 
├─ utils/                # Utils for components 
│
├─ widgets/              # App widgets
   ├─ animations/        # Animations
   ├─ app_bars/          # Different style of app bars
   ├─ bars/              # Different bar styles
   ├─ bottom_sheets/     # Different style of bottom sheets
   ├─ buttons/           # Different style of buttons
   ├─ cards/             # Cards
   ├─ drawer/            # Drawer
   ├─ lists/             # List widgets
   ├─ pop_up/            # Pop Up dialogs
   ├─ quran/             # Widgets related to the Quran
   ├─ tags/              # Tags

```

## Credits

* text and translations [Quran.com](https://quran.api-docs.io/v4)
* text styles downloaded from [urdunigaar.com](https://urdunigaar.com/download-quranic-font-quran-standard-font-islamic-fonts/)
* translation, tafsir and Arabic data come from [quranenc](https://quranenc.com) and [King Saud University](https://quran.ksu.edu.sa). a small number of translations also come from [tanzil](http://tanzil.net).

## Contributing

If you'd like to contribute, please take a look at the [PRs Welcome](https://github.com/fabrikod/the-open-quran/issues?q=is%3Aopen+is%3Aissue+label%3A%22PRs+Welcome%22) label on the issue tracker. For new features, please open an issue to discuss it before beginning implementation.
May Allah reward all the awesome [Contributors and Translators](https://github.com/quran/quran_android/blob/master/CONTRIBUTORS.md).



## Open Source Projects Used

* [Android Studio](https://developer.android.com/studio?gclid=Cj0KCQiA0oagBhDHARIsAI-BbgciR2_gugCRVcF8rsi9XOfx0ITaWZcyypUSNvJgMVfg29Jf2iPXhWUaAqiaEALw_wcB&gclsrc=aw.ds)
* [VS Code](https://code.visualstudio.com/)
* [Flutter](https://flutter.dev/)
* [Figma](https://www.figma.com/)
* [Material Design Components](https://github.com/material-components/material-components-android)
* [Quran.com](https://quran.api-docs.io/v4)


### License

This application is released under the [MIT license](LICENSE.md). You can use the code for any purpose, including commercial projects.

[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

