// Modify introReducer to handle the new action
import 'package:mytodo/control/store/actions.dart';
import 'package:mytodo/control/store/store.dart';

AppState introReducer(AppState state, action) {
  if (action is ToggleIntroAction) {
    return AppState(
      isIntro: !state.isIntro,
      theme: state.theme,
      language: state.language,
    );
  }
  return state;
}

// Modify themeReducer to handle the new action
AppState themeReducer(AppState state, action) {
  if (action is UpdateThemeAction) {
    return AppState(
      isIntro: state.isIntro,
      theme: action.theme,
      language: state.language,
    );
  }
  return state;
}

// Modify languageReducer to handle the new action
AppState languageReducer(AppState state, action) {
  if (action is UpdateLanguageAction) {
    return AppState(
      isIntro: state.isIntro,
      theme: state.theme,
      language: action.language,
    );
  }
  return state;
}
