import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/book_progres_component.dart';
import 'package:polyread/core/base_components/custom_file_image_component.dart';
import 'package:polyread/data/controllers/my_books_controller.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';

class MyBooksPage extends GetView<MyBooksController> {
  const MyBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyBooksController());

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      CustomFileImageComponent(path: imageUrl ?? ""),
                      Positioned(
                        top: 4,
                        left: 4,
                        child: GestureDetector(
                          onTap: () => _showEditPanel(book),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  BookProgresComponent(progres: book.progres / 100),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showEditPanel(LibraryStorageModel book) {
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
              padding: const EdgeInsets.all(8.0),
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
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.brown,
                              width: 10.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          width: 120,
                          height: 180,
                          child: CustomFileImageComponent(
                            path: book.bookCoverPath ?? "",
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                book.bookTitle,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                (book.authors ?? []).join(", "),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    onTap: () => controller.toEditMetaDataPage(book.id),
                  ),
                  ListTile(
                    leading: Icon(Icons.delete, color: Colors.red.shade600),
                    title: Text(
                      'Sil',
                      style: TextStyle(color: Colors.red.shade600),
                    ),
                    onTap: () {
                      controller.deleteBook(book.id, book.bookId);
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
