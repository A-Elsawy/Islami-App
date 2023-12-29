import 'package:flutter/material.dart';

class UnSelectedOptionWidget extends StatelessWidget {
  final String unSelectedTitle;
  const UnSelectedOptionWidget({super.key, required this.unSelectedTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(unSelectedTitle),
    );
  }
}
