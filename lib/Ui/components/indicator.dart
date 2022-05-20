import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final String title;
  final double value;
  const Indicator({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        LinearProgressIndicator(
          minHeight: 10,
          // valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          value: value,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
