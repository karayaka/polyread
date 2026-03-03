import 'package:flutter/material.dart';
import 'package:polyread/models/base_models/select_model.dart';

class HorizontalSelector extends StatefulWidget {
  List<SelectModel> list;
  Function onSelected;
  String? selectedItem;
  HorizontalSelector({
    super.key,
    required this.list,
    required this.onSelected,
    this.selectedItem,
  });

  @override
  State<HorizontalSelector> createState() => _HorizontalSelectorState();
}

class _HorizontalSelectorState extends State<HorizontalSelector> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: widget.list.length,
        itemBuilder: (c, i) {
          var item = widget.list[i];
          final isSelected = item.key == widget.selectedItem;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: ChoiceChip(
              label: Text(
                item.value,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: isSelected,
              selectedColor: Colors.deepPurple,
              backgroundColor: Colors.grey.shade200,
              elevation: isSelected ? 3 : 0,
              pressElevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onSelected: (_) {
                widget.onSelected(item);
                setState(() {
                  widget.selectedItem = item.key;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
