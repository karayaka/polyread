import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/custom_tag_selector.dart';
import 'package:polyread/core/base_components/simple_color_picker.dart';
import 'package:polyread/data/controllers/reader_controller.dart';

// ignore: must_be_immutable
class AddPsComponent extends GetView<ReaderController> {
  const AddPsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: controller.psFormModel?.ps ?? "",
            decoration: InputDecoration(hintText: "Not."),
            onChanged: (value) => controller.psFormModel?.ps = value,
          ),
          SimpleColorPicker(
            initialColor: controller.psFormModel?.colorHex != null
                ? Color(controller.psFormModel!.colorHex!)
                : null,
            onColorSelected: (color) =>
                controller.psFormModel?.colorHex = color.toARGB32(),
          ),
          //CustomTagSelector(),
        ],
      ),
    );
  }
}
//todo add kısmı planlanacak