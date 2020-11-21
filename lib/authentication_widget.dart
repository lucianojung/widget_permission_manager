library authentication_widget;

import 'package:flutter/material.dart';

import 'authentication.dart';

class AuthenticationWidget extends StatelessWidget {
  final Authentication auth;
  final String role;
  final Duration duration;
  final Widget child;
  final Widget alternateChild; //optional

  AuthenticationWidget(
      {this.auth, this.role, this.duration, this.child, this.alternateChild});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration != null ? duration : Duration(seconds: 1),
      child: auth.validateRole(role)
          ? child
          : alternateChild != null
              ? alternateChild
              : SizedBox(),
    );
  }
}
