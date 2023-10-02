import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ja', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? jaText = '',
    String? esText = '',
  }) =>
      [enText, jaText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '0zbutu35': {
      'en': 'Email Address',
      'es': '',
      'ja': '',
    },
    'lacfvhcl': {
      'en': 'Email Address',
      'es': '',
      'ja': '',
    },
    'x4xeni4w': {
      'en': 'Password',
      'es': '',
      'ja': '',
    },
    'zyj430ck': {
      'en': 'Password',
      'es': '',
      'ja': '',
    },
    'avcf94ra': {
      'en': 'Log In',
      'es': '',
      'ja': '',
    },
    'lxafgikz': {
      'en': 'Don\'t have an account?',
      'es': '',
      'ja': '',
    },
    'f9e0gmxo': {
      'en': 'Create Account',
      'es': '',
      'ja': '',
    },
    'n4klz4nj': {
      'en': 'Forgot Password?',
      'es': '',
      'ja': '',
    },
    'dashuu8j': {
      'en': 'Home',
      'es': '',
      'ja': '',
    },
  },
  // Register
  {
    '2et7t27h': {
      'en': 'Email Address',
      'es': '',
      'ja': '',
    },
    'tey9jop2': {
      'en': 'Email Address',
      'es': '',
      'ja': '',
    },
    'otyb9eon': {
      'en': 'Choose Password',
      'es': '',
      'ja': '',
    },
    'sg30sk0d': {
      'en': 'Choose Password',
      'es': '',
      'ja': '',
    },
    'yyn37o0f': {
      'en': 'Confirm Password',
      'es': '',
      'ja': '',
    },
    '3nrga2rs': {
      'en': 'Confirm Password',
      'es': '',
      'ja': '',
    },
    'sypsm2nh': {
      'en': 'Create Account',
      'es': '',
      'ja': '',
    },
    'fwrfibxk': {
      'en': 'Already have an account?',
      'es': '',
      'ja': '',
    },
    '8u2bfydw': {
      'en': 'Login',
      'es': '',
      'ja': '',
    },
    'jeecfgg4': {
      'en': 'Continue as Guest',
      'es': '',
      'ja': '',
    },
    'sccvu7lw': {
      'en': 'Home',
      'es': '',
      'ja': '',
    },
  },
  // MyYYs
  {
    'xi36v6vo': {
      'en': 'My Team',
      'es': '',
      'ja': '',
    },
    'yubdgtzg': {
      'en': 'My Friends',
      'es': '',
      'ja': '',
    },
  },
  // completeProfile
  {
    'k95bxqrd': {
      'en': 'Complete Profile',
      'es': '',
      'ja': '',
    },
    '3mmdm6kz': {
      'en': 'Your age',
      'es': '',
      'ja': '',
    },
    '1gbt8ujs': {
      'en': 'rude',
      'es': '',
      'ja': '',
    },
    'wnzz7l6c': {
      'en': 'Your Name',
      'es': '',
      'ja': '',
    },
    'eh4t3cqu': {
      'en': 'What do you want to be called?',
      'es': '',
      'ja': '',
    },
    'zgot294i': {
      'en': 'Your Gender',
      'es': '',
      'ja': '',
    },
    'hmrtfvre': {
      'en': 'insert chromosome here',
      'es': '',
      'ja': '',
    },
    'owjtt20v': {
      'en': 'desiredGender',
      'es': '',
      'ja': '',
    },
    'j3wjbgit': {
      'en': 'insert desired chromosomes here',
      'es': '',
      'ja': '',
    },
    '6op22kfk': {
      'en': 'Your location',
      'es': '',
      'ja': '',
    },
    'oudwgkpc': {
      'en': 'where in the world am I today?',
      'es': '',
      'ja': '',
    },
    '7wiq0wxp': {
      'en': 'Your EverythingElseEnteredSoon',
      'es': '',
      'ja': '',
    },
    '61gli6x7': {
      'en': 'The questionare is big bro this is beginning :)',
      'es': '',
      'ja': '',
    },
    '1h9yc7n3': {
      'en': 'Save Profile',
      'es': '',
      'ja': '',
    },
    'a83235cs': {
      'en': 'Home',
      'es': '',
      'ja': '',
    },
  },
  // forgotPassword
  {
    '9i9lumlu': {
      'en': 'Forgot Password',
      'es': '',
      'ja': '',
    },
    'y5l6rw8h': {
      'en': 'Your Email Address',
      'es': '',
      'ja': '',
    },
    'syqhgp9c': {
      'en': 'Please enter a email...',
      'es': '',
      'ja': '',
    },
    '2wqc1zal': {
      'en': 'Send Reset Link',
      'es': '',
      'ja': '',
    },
    'gg7hkyp3': {
      'en': 'Home',
      'es': '',
      'ja': '',
    },
  },
  // chatDetails
  {
    '69pmsvjh': {
      'en': 'Job Title',
      'es': '',
      'ja': '',
    },
    '3ozff4py': {
      'en': 'Employed Since',
      'es': '',
      'ja': '',
    },
    'zshl1n1n': {
      'en': 'Home',
      'es': '',
      'ja': '',
    },
  },
  // chatMain
  {
    'q90exng5': {
      'en': 'All Chats',
      'es': '',
      'ja': '',
    },
  },
  // changePassword
  {
    '8oi8xnjd': {
      'en': 'Change Password',
      'es': '',
      'ja': '',
    },
    'oel0ew9b': {
      'en': 'Your Email Address',
      'es': '',
      'ja': '',
    },
    'ntz1gt3m': {
      'en': 'Please enter a email...',
      'es': '',
      'ja': '',
    },
    's8om9dqi': {
      'en': 'Send Reset Link',
      'es': '',
      'ja': '',
    },
    'qs2wn2dy': {
      'en': 'Home',
      'es': '',
      'ja': '',
    },
  },
  // userAccountSettings
  {
    'zd8uvtjp': {
      'en': 'Switch to Dark Mode',
      'es': '',
      'ja': '',
    },
    'azzc7g62': {
      'en': 'Switch to Light Mode',
      'es': '',
      'ja': '',
    },
    '5vs63gtq': {
      'en': 'Account Settings',
      'es': '',
      'ja': '',
    },
    'q0z4hwa1': {
      'en': 'Edit Profile',
      'es': '',
      'ja': '',
    },
    'tb48nqn5': {
      'en': 'Change Password',
      'es': '',
      'ja': '',
    },
    'mly6a58h': {
      'en': 'Log Out',
      'es': '',
      'ja': '',
    },
  },
  // editProfile
  {
    'pmbfnq99': {
      'en': 'Edit Profile',
      'es': '',
      'ja': '',
    },
    'kqf1dom2': {
      'en': 'Email Address',
      'es': '',
      'ja': '',
    },
    '435jrnt6': {
      'en': 'Full Name',
      'es': '',
      'ja': '',
    },
    'ouq5jrdi': {
      'en': 'Job Title',
      'es': '',
      'ja': '',
    },
    'lk2nrrux': {
      'en': 'Save Changes',
      'es': '',
      'ja': '',
    },
    'f355d73r': {
      'en': 'Home',
      'es': '',
      'ja': '',
    },
  },
  // WelcomeHome
  {
    '676vjcjy': {
      'en': 'ZenDaily Reward Screen',
      'es': '',
      'ja': '',
    },
    'ak1zn145': {
      'en': 'Humble Tea',
      'es': '',
      'ja': '',
    },
    'bhbwewlg': {
      'en': '10:00am',
      'es': '',
      'ja': '',
    },
    'elwf9bcy': {
      'en':
          'Today is a good day to finish the basis of this app. Everyday your skill and knowledge base grows. The Pages that follow this do not matter yet, the concept is what is key. This page illustrates the daily reward located below with rotating calming picture above and a tracker below where insitity and other details are listed below. ',
      'es': '',
      'ja': '',
    },
    'e0bf2jpi': {
      'en': 'Tea For You',
      'es': '',
      'ja': '',
    },
    'f82wa7p3': {
      'en': 'Days In A Row Tea Claimed For Current Month With Streak',
      'es': '',
      'ja': '',
    },
    'ympuwrso': {
      'en': 'Continue',
      'es': '',
      'ja': '',
    },
  },
  // DailyMatches3
  {
    '6rib9gnk': {
      'en': 'Daily Three',
      'es': '',
      'ja': '',
    },
    'nffrcts8': {
      'en': 'Y',
      'es': '',
      'ja': '',
    },
    't1tt3k32': {
      'en': 'E',
      'es': '',
      'ja': '',
    },
    'lj7lrpia': {
      'en': 'S',
      'es': '',
      'ja': '',
    },
    'furl1blr': {
      'en': 'Choose Wisely ',
      'es': '',
      'ja': '',
    },
    '6faxykds': {
      'en': '10:00am',
      'es': '',
      'ja': '',
    },
    'fn4262ue': {
      'en':
          'Trying to figure out the flow for the best of 3 matches but this is  a beginning that even if it goes nowhere or moves to another service the concept is here the path forward is possible if not yet clear.',
      'es': '',
      'ja': '',
    },
    'iynqnlx9': {
      'en': 'Matches delete daily',
      'es': '',
      'ja': '',
    },
    '2akarrg7': {
      'en': 'Chat With Matchs Met',
      'es': '',
      'ja': '',
    },
  },
  // MatchProfileFS
  {
    '6omnwprd': {
      'en': 'A Rose By Any Other Name ',
      'es': '',
      'ja': '',
    },
    '6plc2t0e': {
      'en': 'Not For Me                For Me Choose ',
      'es': '',
      'ja': '',
    },
    'z0cssh6a': {
      'en': 'Y',
      'es': '',
      'ja': '',
    },
    '0mnmakh8': {
      'en': 'Y',
      'es': '',
      'ja': '',
    },
  },
  // SearchBar
  {
    'xlppk2os': {
      'en': 'Search for friends...',
      'es': '',
      'ja': '',
    },
    '02o299rf': {
      'en': 'Find your friend by na',
      'es': '',
      'ja': '',
    },
  },
  // friendList
  {
    'l45uvclv': {
      'en': 'Alex Edwards',
      'es': '',
      'ja': '',
    },
    'f5qhyubo': {
      'en': '[userEmail]',
      'es': '',
      'ja': '',
    },
  },
  // emptyList
  {
    'cet5ogsg': {
      'en': 'No Messages',
      'es': '',
      'ja': '',
    },
    'v47pe7vj': {
      'en':
          'Seems you don\'t have any messages here, search your friends list in order to get started.',
      'es': '',
      'ja': '',
    },
    'x8s700lp': {
      'en': 'Find Friends',
      'es': '',
      'ja': '',
    },
  },
  // Miscellaneous
  {
    'eoi7mi0f': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'agajvye4': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'f7nwmx6s': {
      'en': '',
      'es': '',
      'ja': '',
    },
    's1veu0pu': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'rsw0fpjo': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '59q8lezv': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'iyyzylrx': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '3uv7lbyq': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'hdmmp4pl': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'j9j9q041': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'modbw8e6': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '1hpu2qh4': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '9xc03bkx': {
      'en': '',
      'es': '',
      'ja': '',
    },
    't6xifia6': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'bkqc0oj0': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '0kcwcemu': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '01liojiz': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '4ck5g3pt': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '5e6kiclb': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '7cquphzi': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'a9hj4yfn': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'loinhowr': {
      'en': '',
      'es': '',
      'ja': '',
    },
    '0owyri3t': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'yvfbumvp': {
      'en': '',
      'es': '',
      'ja': '',
    },
    'ybqr3xg7': {
      'en': '',
      'es': '',
      'ja': '',
    },
  },
].reduce((a, b) => a..addAll(b));
