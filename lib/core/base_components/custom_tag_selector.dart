import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:textfield_tags/textfield_tags.dart';

// ignore: must_be_immutable
class CustomTagSelector extends StatefulWidget {
  List<String> suggestion;
  List<String> initialTags;
  StringTagController stringTagController;

  CustomTagSelector({
    super.key,
    required this.suggestion,
    required this.initialTags,
    required this.stringTagController,
  });

  @override
  State<CustomTagSelector> createState() => _CustomTagSelectorState();
}

class _CustomTagSelectorState extends State<CustomTagSelector> {
  late double _distanceToField;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.stringTagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsViewBuilder: (context, onSelected, options) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return TextButton(
                      onPressed: () {
                        onSelected(option);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '#$option',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 74, 137, 92),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return widget.suggestion.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selectedTag) {
        widget.stringTagController.onTagSubmitted(selectedTag);
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFieldTags<String>(
              textEditingController: textEditingController,
              focusNode: focusNode,
              textfieldTagsController: widget.stringTagController,
              initialTags: widget.initialTags,
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              inputFieldBuilder: (context, inputFieldValues) {
                return TextField(
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,

                  decoration: InputDecoration(
                    helperText: "Etiket eklemek için enter tuşuna basın",
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Get.theme.primaryColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Get.theme.primaryColor,
                        width: 1.0,
                      ),
                    ),
                    helperStyle: TextStyle(color: Get.theme.primaryColor),
                    hintText: inputFieldValues.tags.isNotEmpty
                        ? ''
                        : "Etiketle...",
                    errorText: inputFieldValues.error,
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: _distanceToField * 0.74,
                    ),
                    prefixIcon: inputFieldValues.tags.isNotEmpty
                        ? SingleChildScrollView(
                            controller: inputFieldValues.tagScrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: inputFieldValues.tags.map((String tag) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    color: Get.theme.primaryColor,
                                  ),
                                  margin: const EdgeInsets.only(right: 10.0),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          '#$tag',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onTap: () {
                                          print("$tag selected");
                                        },
                                      ),
                                      const SizedBox(width: 4.0),
                                      InkWell(
                                        child: const Icon(
                                          Icons.cancel,
                                          size: 14.0,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          inputFieldValues.onTagRemoved(tag);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        : null,
                  ),
                  onChanged: inputFieldValues.onTagChanged,
                  onSubmitted: inputFieldValues.onTagSubmitted,
                );
              },
            );
          },
    );
  }
}
