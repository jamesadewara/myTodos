import 'package:mytodo/control/store/store.dart';

enum IntroActions { logic }

AppState introReducer(AppState state, action) {
  if (action == IntroActions.logic) {
    return AppState(isIntro: !state.isIntro!);
  }
  return state;
}

enum ThemeActions { logic }

AppState themeReducer(AppState state, action) {
  if (action == ThemeActions.logic) {
    return AppState(theme: state.theme);
  }
  return state;
}

enum LanguageActions { logic }

AppState languageReducer(AppState state, action) {
  if (action == LanguageActions.logic) {
    return AppState(language: state.language);
  }
  return state;
}
