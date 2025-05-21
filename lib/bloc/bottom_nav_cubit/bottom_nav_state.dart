part of 'bottom_nav_cubit.dart';

@immutable
sealed class BottomNavState {
  final int selectedIndex;
  const BottomNavState(this.selectedIndex);
}
