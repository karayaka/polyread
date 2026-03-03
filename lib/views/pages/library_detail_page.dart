import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/base_components/book_circular_progress_component.dart';
import 'package:polyread/core/base_components/custom_network_image.dart';
import 'package:polyread/data/controllers/library_controller.dart';

class LibraryDetailPage extends GetView<LibraryController> {
  const LibraryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final book = controller.selectedBook;
    controller.bookDowloandProgres.value = 0;
    controller.hasBook();

    if (book == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Kitap')),
        body: const Center(child: Text('Seçili kitap bulunamadı')),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 320,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              title: Text(
                book.bookTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
              background: Hero(
                tag: book.bookId,
                child: CustomNetworkImage(url: book.bookCoverPath ?? ""),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.bookTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  if ((book.authors?.length ?? 0) > 0)
                    Text(
                      book.authors!.join(', '),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Chip(
                        label: Text('${book.downloadCount ?? 0} İndirilen'),
                        backgroundColor: Theme.of(
                          context,
                        ).chipTheme.backgroundColor,
                      ),
                      Chip(label: Text(book.langugeCode ?? "".toUpperCase())),
                      Obx(() {
                        if (controller.onProgres()) {
                          return BookCircularProgressComponent(
                            prgs: controller.bookDowloandProgres.value,
                          );
                        } else if (controller.onButton()) {
                          return OutlinedButton.icon(
                            onPressed: () {
                              controller.toReaderPage();
                            },
                            icon: const Icon(Icons.book_outlined),
                            label: const Text('Oku'),
                          );
                        } else {
                          return OutlinedButton.icon(
                            onPressed: () {
                              controller.dowloandBook(
                                book.bookId,
                                book.bookPath,
                              );
                            },
                            icon: const Icon(Icons.download_outlined),
                            label: const Text('İndir'),
                          );
                        }
                      }),
                    ],
                  ),

                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),

                  Text('Özet', style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Text(
                    book.summaries ?? "",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
