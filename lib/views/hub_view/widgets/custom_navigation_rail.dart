import 'package:flutter/material.dart';
import 'package:real_estate_allotment/core/theme/app_theme.dart';

class CustomNavigationRail extends StatelessWidget {
  final List<CustomNavigationRailDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125, // Adjust width as needed
      padding: const EdgeInsets.only(left: 5),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: List.generate(
          destinations.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Material(
              elevation: 0,
              color: AppTheme.transparent,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: InkWell(
                onTap: () => onDestinationSelected(index),
                splashColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                child: destinations[index].build(
                  context,
                  isSelected: index == selectedIndex,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavigationRailDestination {
  final IconData icon;
  final String label;

  CustomNavigationRailDestination({
    required this.icon,
    required this.label,
  });

  Widget build(BuildContext context, {required bool isSelected}) {
    final selectedColor = Theme.of(context).colorScheme.primary;

    return Ink(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: isSelected
            ? selectedColor
            : Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
