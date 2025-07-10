import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Model class representing a navigation item
/// Follows Single Responsibility Principle - only handles navigation item data
class NavigationItem {
  final String iconPath;
  final int index;
  final String semanticLabel;

  const NavigationItem({
    required this.iconPath,
    required this.index,
    required this.semanticLabel,
  });
}

/// Custom bottom navigation widget with transparent design and icon-only layout
/// Follows Open/Closed Principle - extensible without modification
class CustomBottomNavigation extends StatelessWidget {
  /// Current selected tab index
  final int currentIndex;
  
  /// Callback function when a tab is tapped
  final Function(int) onTap;

  /// Navigation items configuration - centralized menu structure
  /// Follows Single Responsibility Principle - separates configuration from UI logic
  static const List<NavigationItem> _navigationItems = [
    NavigationItem(
      iconPath: 'assets/images/icons/bottom-nav/home.svg',
      index: 0,
      semanticLabel: 'Home',
    ),
    NavigationItem(
      iconPath: 'assets/images/icons/bottom-nav/bible.svg',
      index: 1,
      semanticLabel: 'Bible',
    ),
    NavigationItem(
      iconPath: 'assets/images/icons/bottom-nav/calendar.svg',
      index: 2,
      semanticLabel: 'Calendar',
    ),
    NavigationItem(
      iconPath: 'assets/images/icons/bottom-nav/settings.svg',
      index: 3,
      semanticLabel: 'Settings',
    ),
  ];

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: _buildContainerDecoration(),
      child: _buildNavigationRow(),
    );
  }

  /// Builds the container decoration with shadow effects
  /// Follows Single Responsibility Principle - handles only decoration logic
  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    );
  }

  /// Builds the row of navigation items
  /// Follows DRY principle - generates items from configuration
  Widget _buildNavigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _navigationItems
          .map((item) => _buildNavItem(item))
          .toList(),
    );
  }

  /// Builds individual navigation item widget
  /// Follows Single Responsibility Principle - handles only single nav item logic
  /// 
  /// [item] - Navigation item configuration containing icon path, index, and label
  Widget _buildNavItem(NavigationItem item) {
    final isSelected = currentIndex == item.index;
    
    return Semantics(
      label: item.semanticLabel,
      button: true,
      selected: isSelected,
      child: GestureDetector(
        onTap: () => onTap(item.index),
        behavior: HitTestBehavior.opaque, // Improves tap responsiveness
        child: Container(
          padding: const EdgeInsets.all(10),
          child: _buildIconContainer(item.iconPath, isSelected),
        ),
      ),
    );
  }

  /// Builds the icon container with proper styling
  /// Follows Single Responsibility Principle - handles only icon presentation
  /// 
  /// [iconPath] - Path to the SVG icon asset
  /// [isSelected] - Whether this item is currently selected
  Widget _buildIconContainer(String iconPath, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildIcon(iconPath, isSelected),
    );
  }

  /// Builds the SVG icon with appropriate color filtering
  /// Follows Single Responsibility Principle - handles only icon rendering
  /// 
  /// [iconPath] - Path to the SVG icon asset
  /// [isSelected] - Whether this item is currently selected
  Widget _buildIcon(String iconPath, bool isSelected) {
    return SvgPicture.asset(
      iconPath,
      width: 28,
      height: 28,
      colorFilter: ColorFilter.mode(
        _getIconColor(isSelected),
        BlendMode.srcIn,
      ),
      semanticsLabel: '', // Empty since parent has semantic label
    );
  }

  /// Determines the appropriate icon color based on selection state
  /// Follows Single Responsibility Principle - handles only color logic
  /// 
  /// [isSelected] - Whether the icon is for a selected item
  /// Returns: Color to be applied to the icon
  Color _getIconColor(bool isSelected) {
    return isSelected ? const Color(0xFF2196F3) : Colors.white;
  }
} 