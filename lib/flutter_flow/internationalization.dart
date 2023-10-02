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
    '3rebwnc0': {
      'en': 'YourNumber',
      'es': '',
      'ja': '',
    },
    '02ttd3y1': {
      'en': 'what is my phone number?',
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
    'ww0ae454': {
      'en': 'ZenDaily Reward Screen',
      'es': '',
      'ja': '',
    },
    '9i7w88sr': {
      'en': 'Humble Tea',
      'es': '',
      'ja': '',
    },
    '3y7qbv63': {
      'en': '10:00am',
      'es': '',
      'ja': '',
    },
    'eke2e8qa': {
      'en':
          'Today is a good day to finish the basis of this app. Everyday your skill and knowledge base grows. The Pages that follow this do not matter yet, the concept is what is key. This page illustrates the daily reward located below with rotating calming picture above and a tracker below where insitity and other details are listed below. ',
      'es': '',
      'ja': '',
    },
    'xs94hgty': {
      'en': 'Tea For You',
      'es': '',
      'ja': '',
    },
    'kw9zyia8': {
      'en': 'Days In A Row Tea Claimed For Current Month With Streak',
      'es': '',
      'ja': '',
    },
    'v6mw49l9': {
      'en': 'Continue',
      'es': '',
      'ja': '',
    },
  },
  // DailyMatches3
  {
    'ujrqw8ka': {
      'en': 'Daily Three',
      'es': '',
      'ja': '',
    },
    'd1wq1lt3': {
      'en': 'Y',
      'es': '',
      'ja': '',
    },
    'fnqiy9ok': {
      'en': 'E',
      'es': '',
      'ja': '',
    },
    'clq2xsfy': {
      'en': 'S',
      'es': '',
      'ja': '',
    },
    '0so1dzz9': {
      'en': 'Choose Wisely ',
      'es': '',
      'ja': '',
    },
    '1q0sbop9': {
      'en': '10:00am',
      'es': '',
      'ja': '',
    },
    '4nxumg04': {
      'en':
          'Trying to figure out the flow for the best of 3 matches but this is  a beginning that even if it goes nowhere or moves to another service the concept is here the path forward is possible if not yet clear.',
      'es': '',
      'ja': '',
    },
    'mblycjur': {
      'en': 'Matches delete daily',
      'es': '',
      'ja': '',
    },
    '4uu7pp9i': {
      'en': 'Chat With Matchs Met',
      'es': '',
      'ja': '',
    },
  },
  // MatchProfileFS
  {
    'tls39zxs': {
      'en': ' Not For Me              For Me Choose ',
      'es': '',
      'ja': '',
    },
    '9lareho0': {
      'en': 'Y',
      'es': '',
      'ja': '',
    },
    'c8ozzxwy': {
      'en': 'Y',
      'es': '',
      'ja': '',
    },
  },
  // connectionConfirmed
  {
    'iqu1jg8v': {
      'en': '      Connection Is Potential ',
      'es': '',
      'ja': '',
    },
    'krq611jn': {
      'en': 'Both Parties Agree To This Paring',
      'es': '',
      'ja': '',
    },
    'wo0te5d9': {
      'en': '10:00am',
      'es': '',
      'ja': '',
    },
    'jkesztxj': {
      'en': 'May Suggested Activity Be In Your Favor',
      'es': '',
      'ja': '',
    },
    'i1pyd9zo': {
      'en': 'Start Chatting',
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
