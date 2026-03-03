import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookProgresComponent extends StatelessWidget {
  double progres = 0.0;
  BookProgresComponent({super.key, required this.progres});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        LinearProgressIndicator(
          value: progres,
          //strokeWidth: 3,
          backgroundColor: Colors.grey[300],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            '${(progres * 100).toStringAsFixed(0)}%',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
