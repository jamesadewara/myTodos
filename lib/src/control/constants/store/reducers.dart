import 'package:mytodo/src/control/constants/store/actions.dart';
import 'package:mytodo/src/control/constants/store/store.dart';

AppState introReducer(AppState state, action) {
  if (action is ToggleIntroAction) {
    return state.copyWith(isIntro: !state.isIntro);
  }
  return state;
}

AppState themeReducer(AppState state, action) {
  if (action is UpdateThemeAction) {
    return state.copyWith(theme: action.theme);
  }
  return state;
}

// Modify languageReducer to handle the new action
AppState languageReducer(AppState state, action) {
  if (action is UpdateLanguageAction) {
    return state.copyWith(language: action.language);
  }
  return state;
}
