part of 'theme_bloc.dart';


abstract class ThemeEvent {}
class ToggleTheme extends ThemeEvent{
  final bool isDark;

  ToggleTheme({required this.isDark});
}
class GetTheme extends ThemeEvent{

}