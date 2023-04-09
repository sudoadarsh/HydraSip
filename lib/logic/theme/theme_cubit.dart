import 'package:bloc/bloc.dart';
import 'package:hydra_sip/constants/constants.dart';
import 'package:hydra_sip/utils/shared_pref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState());

  bool? activeTheme;

  /// To get the current app theme and store it in the memory.
  /// This shall be called when the settings page is accessed.
  void getActiveTheme() async {
    if (activeTheme != null) return;
    activeTheme = SharedPref.getBool(KeyConstants.appTheme);
  }

  /// To toggle theme.
  void toggleTheme() {
    // Get the current theme.
    if (activeTheme == null) return;
    emit(ThemeState(appTheme: !activeTheme!));
  }
}
