import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/horizontal_selector.dart';
import 'package:polyread/data/controllers/reader_controller.dart';

class BookPsListComponent extends GetView<ReaderController> {
  const BookPsListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.bookLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return _builList();
    });
  }

  //pannel için tasarım yapılacak flutter_slidable: ^4.0.3 ekelnecek güncelle sil ekranları açılabilir olacak
  Widget _builList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Tag Filtre:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: HorizontalSelector(
              selectedItem: controller.selectedTag,
              list: controller.tagSelectModel,
              onSelected: (tag) {
                controller.selectedTag = tag.key;
                controller.filterPsTags();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Notlar:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              itemCount: controller.psList.length,
              separatorBuilder: (context, index) =>
                  Divider(height: 1, thickness: 0.5, color: Colors.grey[200]),
              itemBuilder: (context, i) {
                var ps = controller.psList[i];
                return ListTile(
                  /*contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),*/
                  title: Text(
                    _getPsText(ps.ps),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: .start,
                    children: [Text("Text: ${ps.text}"), _getTags(ps.tags)],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: () {
                    if (ps.pageCfi != null) {
                      controller.epubController.display(cfi: ps.pageCfi ?? "");
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTags(List<String>? tags) => SizedBox(
    height: 22,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tags?.length ?? 0,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text("#${tags?[i]}", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    ),
  );
  String _getPsText(String? ps) {
    return "Not: ${ps == null || ps == "" ? "Vurgu!" : ps}";
  }
}
