import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: MyTheme.light)) {
    on<ToggleTheme>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      if (event.isDark == false) {
        emit(ThemeState(theme: MyTheme.light));
      } else {
        emit(ThemeState(theme: MyTheme.dark));
      }
      prefs.setBool("theme", event.isDark);
    });
    on<GetTheme>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final theme = prefs.getBool("theme") ?? false;
      emit(ThemeState(theme: theme ? MyTheme.dark : MyTheme.light));
    });
  }
}
