import 'package:flutter_base_project/utills/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', 0, colorScheme),
          _buildNavItem(Icons.settings, 'Settings', 1, colorScheme),
          _buildNavItem(Icons.person, 'Profile', 2, colorScheme),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, ColorScheme colorScheme) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: isSelected ? TTheme.primaryColor.withOpacity(0.3) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected? TTheme.primaryColor.withOpacity(0.9):colorScheme.onSecondaryContainer,
            ),
           // const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected? TTheme.primaryColor.withOpacity(0.9):colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
