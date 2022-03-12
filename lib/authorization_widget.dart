import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'authorization.dart';

class AuthorizationWidget extends StatelessWidget {
  final Key? key;
  final List<Tuple2<Authorization, Widget>> children;
  final dynamic role;
  final Duration? duration;
  final Duration? reverseDuration;
  final Curve? switchInCurve;
  final Curve? switchOutCurve;
  final TransitionBuilder? transitionBuilder;
  final Widget Function(Widget?, List<Widget>)? layoutBuilder;

  AuthorizationWidget(
      {this.key,
      this.duration,
      required this.children,
      this.transitionBuilder,
      this.layoutBuilder,
      required this.role,
      this.switchInCurve,
      this.switchOutCurve,
      this.reverseDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// handles the AuthorizationWidget with an AnimatedSwitcher to switch between the widgets of different authorizations
    return AnimatedSwitcher(
      key: key ?? GlobalKey(),
      transitionBuilder:
          transitionBuilder as Widget Function(Widget, Animation<double>)? ??
              AnimatedSwitcher.defaultTransitionBuilder,
      layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
      duration: duration != null ? duration! : Duration(milliseconds: 500),
      reverseDuration: reverseDuration ?? Duration(milliseconds: 500),
      switchInCurve: switchInCurve ?? Curves.linear,
      switchOutCurve: switchOutCurve ?? Curves.linear,
      child: _getWidget(),
    );
  }

  _getWidget() {
    /// gets the first widget matching the roles authorization or Else an empty SizedBox
    Tuple2<Authorization, Widget> orElse =
        Tuple2(Authorization(-1, '', []), SizedBox());
    return children
        .firstWhere((element) => element.item1.validateRole(role),
            orElse: () => orElse)
        .item2;
  }
}
