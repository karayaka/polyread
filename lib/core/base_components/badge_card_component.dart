import 'package:flutter/material.dart';

class BadgeCardComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isEarned;
  const BadgeCardComponent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isEarned,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isEarned
            ? color.withValues(alpha: 0.1)
            : Colors.grey.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isEarned
              ? color.withValues(alpha: 0.5)
              : Colors.grey.withValues(alpha: 0.2),
          width: 2,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: isEarned ? color : Colors.grey.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isEarned
                        ? color.withValues(alpha: 0.8)
                        : Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (isEarned)
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.check_circle, color: color, size: 20),
            ),
        ],
      ),
    );
  }
}
