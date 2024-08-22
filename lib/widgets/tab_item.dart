import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.index,
      required this.selectedIndex,
      required this.onTap});
  final String label;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: selectedIndex == index ? Colors.white : Colors.black,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: selectedIndex == index ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
