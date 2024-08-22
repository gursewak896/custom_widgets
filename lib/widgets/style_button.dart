import 'package:flutter/material.dart';

class StyleButton extends StatelessWidget {
  const StyleButton(
      {super.key,
      this.icon,
      this.style,
      this.isSelected = false,
      required this.onTap});
  final IconData? icon;
  final String? style;
  final bool isSelected;
  final VoidCallback onTap;

  // String selectedStyle = "Regular";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: IconButton(
        icon: Icon(
          icon,
          size: 16,
        ),
        color: isSelected ? Colors.white : Colors.black,
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                isSelected ? Colors.black : Colors.transparent)),
        onPressed: onTap,
        // () {
        //   setState(() {
        //     if (selectedStyle == widget.style) {
        //       selectedStyle = "Regular"; // Unselect if tapped twice
        //     } else {
        //       selectedStyle =
        //           widget.style ?? "Regular"; // Set to the selected style
        //     }
        //   });
        // },
      ),
    );
  }
}
