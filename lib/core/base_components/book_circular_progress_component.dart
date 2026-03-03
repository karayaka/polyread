import 'package:flutter/material.dart';

class BookCircularProgressComponent extends StatelessWidget {
  double? progress = 0.0;
  BookCircularProgressComponent({super.key, required double? prgs}) {
    if (prgs == -1) {
      progress = null;
    } else {
      progress = prgs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 6,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
          Text(
            '%${(((progress ?? 0) * 100).toStringAsFixed(0))}',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
