import 'package:flutter/material.dart';



class DialogImagine extends StatelessWidget {
  const DialogImagine({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Wrap(
        children: [
          Container(
            // decoration: BoxDecoration(color: Colors.grey.shade200),
            // margin: const EdgeInsets.symmetric(
            //   // vertical: 20,
            //   horizontal: 30,
            // ),
            padding: const EdgeInsets.all(20),
            child: child,
          ),
        ],
      ),
    );
  }
}
