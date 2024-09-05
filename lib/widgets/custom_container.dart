import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatefulWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;
  final Widget? widget;

  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.widget,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  String? tappedWidgetType;
  Widget? tappedWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: widget.color,
          ),
          child: Center(
            child: _buildChild(widget.widget),
          ),
        ),
        const SizedBox(height: 20),
        tappedWidgetType != null
            ? Text('Widget Type: $tappedWidgetType')
            : Container(),
      ],
    );
  }

  Widget _buildChild(Widget? child) {
    if (child == null) return Container();

    if (child is Column || child is Row) {
      List<Widget> children = (child as dynamic).children;

      return child is Column
          ? Column(
              children:
                  children.map((widget) => _wrapWithGesture(widget)).toList(),
            )
          : Row(
              children:
                  children.map((widget) => _wrapWithGesture(widget)).toList(),
            );
    } else {
      return _wrapWithGesture(child);
    }
  }

  Widget _wrapWithGesture(Widget widget) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              tappedWidgetType = widget.runtimeType.toString();
              tappedWidget = widget;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: tappedWidget == widget
                  ? Border.all(color: Colors.blue, width: 2.0)
                  : null,
            ),
            child: widget,
          ),
        ),
      ],
    );
  }
}
