import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/book_progres_component.dart';
import 'package:polyread/core/base_components/custom_file_image_component.dart';
import 'package:polyread/data/controllers/my_books_controller.dart';

class MyBooksPage extends GetView<MyBooksController> {
  const MyBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyBooksController());
    return DefaultTabController(
      length: 4,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);

          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              print("Aktif Tab Index: ${tabController.index}");
            }
          });

          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              appBar: AppBar(
                elevation: 0,
                centerTitle: false,
                title: const Text(
                  "Kitaplarım",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TabBar(
                      controller: tabController,
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Theme.of(
                        context,
                      ).colorScheme.onSurfaceVariant,
                      tabs: const [
                        Tab(icon: Icon(Icons.library_books)),
                        Tab(icon: Icon(Icons.pause_circle)),
                        Tab(icon: Icon(Icons.play_circle)),
                        Tab(icon: Icon(Icons.check_circle)),
                      ],
                    ),
                  ),
                ),
              ),

              body: Obx(() {
                if (controller.myBooksLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return RefreshIndicator(
                  onRefresh: () => controller.getMyBooks(),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: _bookGrid(),
                  ),
                );
              }),

              floatingActionButton: Obx(() {
                if (controller.importLoading.value) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  );
                }
                return FloatingActionButton.extended(
                  onPressed: controller.addBook,
                  icon: const Icon(Icons.add),
                  label: const Text("Kitap Ekle"),
                );
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _bookGrid() {
    final books = controller.books;
    return MasonryGridView.count(
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
            controller.toReaderPage(book);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.grey[200],
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomFileImageComponent(path: imageUrl ?? ""),
                      BookProgresComponent(progres: book.progres / 100),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
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
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white12,
                        boxShadow: [
                          BoxShadow(blurRadius: 4, color: Colors.black26),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () => _showEditPanel(
                          book.bookId,
                          book.bookTitle,
                          book.id,
                        ),
                        icon: Icon(Icons.edit),
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
  }

  void _showEditPanel(String bookId, String bookName, int id) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Kitap İşlemleri',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(bookName),
                ],
              ),
            ),
            Divider(height: 0),
            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit, color: Colors.blue.shade600),
                    title: Text('Düzenle'),
                    onTap: () => controller.toEditMetaDataPage(id),
                  ),
                  ListTile(
                    leading: Icon(Icons.delete, color: Colors.red.shade600),
                    title: Text(
                      'Sil',
                      style: TextStyle(color: Colors.red.shade600),
                    ),
                    onTap: () {
                      controller.deleteBook(id, bookId);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
