import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'authorization.dart';

class AuthorizationWidget extends StatelessWidget {
  final Key key;
  final List<Tuple2<Authorization, Widget>> children;
  final String role;
  final Duration duration;
  final Duration reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final TransitionBuilder transitionBuilder;
  final Widget Function(Widget, List<Widget>) layoutBuilder;

  AuthorizationWidget(
      {this.key,
      this.duration,
      this.children,
      this.transitionBuilder,
      this.layoutBuilder,
      this.role,
      this.switchInCurve,
      this.switchOutCurve,
      this.reverseDuration})
      : assert(role != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: key ?? GlobalKey(),
      transitionBuilder:
          transitionBuilder ?? AnimatedSwitcher.defaultTransitionBuilder,
      layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
      duration: duration != null ? duration : Duration(milliseconds: 500),
      reverseDuration: reverseDuration ?? Duration(milliseconds: 500),
      switchInCurve: switchInCurve ?? Curves.linear,
      switchOutCurve: switchOutCurve ?? Curves.linear,
      child: _getWidget(),
    );
  }

  _getWidget() {
    var widget =
        children?.where((element) => element?.item1?.validateRole(role))?.toList();
    return widget.isNotEmpty
        ? widget[0].item2
        : SizedBox();
  }
}
