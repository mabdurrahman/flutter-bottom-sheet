import 'package:flutter/material.dart';

typedef void OnWidgetSizeChange(Size size);

class ChangeSizeDetector extends StatefulWidget {
  final Widget child;
  final OnWidgetSizeChange onChange;

  const ChangeSizeDetector({
    Key? key,
    required this.onChange,
    required this.child,
  }) : super(key: key);

  @override
  _ChangeSizeDetectorState createState() => _ChangeSizeDetectorState();
}

class _ChangeSizeDetectorState extends State<ChangeSizeDetector> {
  final _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.onChange(_widgetKey.currentContext?.size ?? Size.infinite));

    return Container(
      key: _widgetKey,
      child: widget.child,
    );
  }
}