import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/app_tools/tools.dart';
import 'package:polyread/core/base_components/custom_network_image.dart';
import 'package:polyread/core/base_components/horizontal_selector.dart';
import 'package:polyread/data/controllers/library_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:polyread/routing/route_const.dart';

class LibraryPage extends GetView<LibraryController> {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LibraryController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Kitaplık",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _getSeacrhPanel();
              },
              icon: Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () => _getFilterPanel(),
              icon: Icon(Icons.filter_list),
            ),
          ],
        ),
        body: Obx(() {
          if (controller.booksLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return RefreshIndicator(
              onRefresh: () => controller.onRefresh(),
              child: Column(
                children: [
                  Expanded(child: _bookGrid()),
                  Obx(() {
                    if (controller.nextPageLoading.value) {
                      return SizedBox(child: LinearProgressIndicator());
                    }
                    return SizedBox();
                  }),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Widget _bookGrid() => Obx(() {
    final books = controller.books;
    return MasonryGridView.count(
      controller: controller.scrollController,
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      itemCount: books.length,
      itemBuilder: (context, i) {
        final book = books[i];
        final imageUrl = book.bookCoverPath;

        return GestureDetector(
          onTap: () {
            controller.selectedBook = book;
            Get.toNamed(RouteConst.bookDetail);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: book.bookId,
                    child: CustomNetworkImage(url: imageUrl ?? ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      book.bookTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  });

  void _getSeacrhPanel() {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Wrap(
          children: [
            TextField(
              onChanged: (value) => controller.searchBooks(value),
              autofocus: true,
              decoration: InputDecoration(
                hint: Text("Ara..."),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getFilterPanel() {
    Get.bottomSheet(
      Container(
        height: 210,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "Kategoriler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            HorizontalSelector(
              list: Tools.bookCateorys,
              selectedItem: controller.selectedTopic?.key ?? "",
              onSelected: (item) {
                if (item.key == "") {
                  controller.selectedTopic = null;
                } else {
                  controller.selectedTopic = item;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "Diller",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            HorizontalSelector(
              list: Tools.languges,
              selectedItem: controller.selectedLanguages?.key ?? "",
              onSelected: (item) {
                controller.selectedLanguages = item;
              },
            ),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                ElevatedButton(
                  onPressed: controller.clearFilter,
                  child: Icon(Icons.delete, color: Colors.red),
                ),
                ElevatedButton(
                  onPressed: controller.filterBooks,
                  child: Icon(Icons.check, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
