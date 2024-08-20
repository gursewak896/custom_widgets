import 'package:flutter/material.dart';

class CustomContainerComponent extends StatelessWidget {
  const CustomContainerComponent(
      {super.key,
      required this.width,
      required this.height,
      this.containerColor,
      this.border,
      this.borderRadius,
      this.image});
  final double width;
  final double height;
  final Color? containerColor;
  final Border? border;
  final BorderRadius? borderRadius;
  final AssetImage? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: containerColor,
          border: border,
          borderRadius: borderRadius,
          image: image != null
              ? DecorationImage(image: image!, fit: BoxFit.cover)
              : null,
        ),
      ),
    );
  }
}
