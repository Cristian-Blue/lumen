import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TabsWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF222222),
        border: Border(bottom: BorderSide(color: Colors.black26)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildTab("Canciones", 0),
            _buildTab("Biblia", 1),
            _buildTab("Predicaciones", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
