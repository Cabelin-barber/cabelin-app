import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  LayoutWidget({super.key, required this.child, this.padding, this.isLoading});

  Widget child;
  bool? isLoading;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading == true
        ? const CircularProgressIndicator.adaptive()
        : Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: child,
        ),
    );
  }
}