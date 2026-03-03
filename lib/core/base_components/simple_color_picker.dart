import 'package:flutter/material.dart';

class SimpleColorPicker extends StatefulWidget {
  final Color? initialColor;
  final Function(Color) onColorSelected;

  const SimpleColorPicker({
    super.key,
    this.initialColor,
    required this.onColorSelected,
  });

  @override
  State<SimpleColorPicker> createState() => _SimpleColorPickerState();
}

class _SimpleColorPickerState extends State<SimpleColorPicker> {
  late Color selectedColor;

  final List<Color> colors = const [
    Colors.white,
    Color(0xff443a49),
    Color(0xfff44336),
    Color(0xffe91e63),
    Color(0xff9c27b0),
    Color(0xff673ab7),
    Color(0xff3f51b5),
    Color(0xff2196f3),
    Color(0xff009688),
    Color(0xff4caf50),
    Color(0xffff9800),
    Color(0xffff5722),
  ];

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor ?? colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: colors.map((color) {
        final isSelected = selectedColor.toARGB32() == color.toARGB32();

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColor = color;
            });

            widget.onColorSelected(color);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: Colors.black, width: 3)
                  : null,
              boxShadow: isSelected
                  ? [const BoxShadow(blurRadius: 6, color: Colors.black26)]
                  : null,
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
