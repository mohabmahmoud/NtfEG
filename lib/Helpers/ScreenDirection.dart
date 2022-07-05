import 'package:flutter/material.dart';

import 'Helper.dart';
class ScreenDirection extends StatefulWidget {
  late Widget child;
  ScreenDirection(this.child);
  @override
  _ScreenDirectionState createState() => _ScreenDirectionState();
}

class _ScreenDirectionState extends State<ScreenDirection> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: Helper.GetCurrentTextDirection(),child: widget.child,);
  }
}
