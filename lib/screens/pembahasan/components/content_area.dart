import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({super.key, required this.child, this.addPadding = true});

  final bool addPadding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        padding: addPadding
            ? const EdgeInsets.only(top: 25, left: 25, right: 25)
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
