import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class FadeRoute extends CustomTransitionPage {
  final Widget page;

  FadeRoute({required this.page})
      : super(
    child: page,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );


}
