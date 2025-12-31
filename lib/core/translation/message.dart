import 'package:get/get.dart';
import 'package:quiz_app/core/translation/translation_keys.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'hi_IN': {
      TranslationKeys.language: 'भाषा',
      TranslationKeys.selected: 'चयनित',
      TranslationKeys.category: 'श्रेणी',
      TranslationKeys.quizCategory: 'क्विज़ श्रेणी',
      TranslationKeys.changeLanguage: 'भाषा बदलें',
      TranslationKeys.changeTheme: 'Change Theme',
    },
    'en_US': {
      TranslationKeys.language: 'Language',
      TranslationKeys.selected: 'Selected',
      TranslationKeys.category: 'Category',
      TranslationKeys.quizCategory: 'Quiz Category',
      TranslationKeys.changeLanguage: 'Change Language',
      TranslationKeys.changeTheme: 'Change Theme',
    },
    'gu_IN': {
      TranslationKeys.language: 'ભાષા',
      TranslationKeys.selected: 'પસંદ કરેલ',
      TranslationKeys.category: 'શ્રેણી',
      TranslationKeys.quizCategory: 'ક્વિઝ શ્રેણી',
      TranslationKeys.changeLanguage: 'ભાષા બદલો',
      TranslationKeys.changeTheme: 'Change Theme',
    },
  };
}
