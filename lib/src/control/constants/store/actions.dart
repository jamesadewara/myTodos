// Define actions for IntroReducer
class ToggleIntroAction {
  final bool action;
  ToggleIntroAction(this.action);
}

// Define actions for ThemeReducer
class UpdateThemeAction {
  final String theme;
  UpdateThemeAction(this.theme);
}

// Define actions for LanguageReducer
class UpdateLanguageAction {
  final String language;
  UpdateLanguageAction(this.language);
}

// // Define an action to handle state rehydration
// class RehydrateAction {
//   final PersistedAppState<AppState> persistedState;

//   RehydrateAction(this.persistedState);
// }
