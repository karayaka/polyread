import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:get/get.dart';
import 'package:polyread/data/controllers/reader_controller.dart';
import 'package:polyread/routing/route_fix.dart';
import 'package:polyread/views/reader_components/chapter_drawer_component.dart';
import 'package:polyread/views/reader_components/setting_panel_component.dart';
import 'package:polyread/views/reader_components/vocabulary_component.dart';

class ReaderPage extends GetView<ReaderController> {
  const ReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: controller.isSavedLocation.value,
      onPopInvokedWithResult: (didPop, t) async {
        if (didPop) return;
        await controller.askSaveBookmarkOnExit();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: SafeArea(
          child: Scaffold(
            key: controller.scaffoldKey,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(8),
              child: Obx(() {
                if (controller.chapterLoading.value) {
                  return LinearProgressIndicator();
                } else {
                  return SizedBox.shrink();
                }
              }),
            ),
            drawer: ChapterDrawerComponent(),
            body: Stack(
              children: [
                Obx(() {
                  if (controller.bookLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return EpubViewer(
                      key: ValueKey('epub_${controller.bookFile.path}'),
                      //initialCfi: controller.bookFromDb?.lastLocationCfi,
                      epubSource: EpubSource.fromFile(controller.bookFile),
                      epubController: controller.epubController,
                      selectAnnotationRange: true,
                      displaySettings: EpubDisplaySettings(
                        //fontSize: (controller.fontSize.value).toInt(),
                        flow: EpubFlow.paginated,
                        useSnapAnimationAndroid: false, //bu false olamalı
                        snap: true,
                        theme: EpubTheme.light(),
                        allowScriptedContent: true,
                      ),
                      onChaptersLoaded: (chapters) {
                        if (chapters.isNotEmpty) {
                          controller.chapterLoaded(chapters);
                        }
                      },
                      onEpubLoaded: () {
                        controller.epubLoaded();
                      },
                      onRelocated: (value) {
                        controller.showbottomBar.value = false;
                        controller.isSavedLocation.value =
                            controller.lastSavedLocationCfi == value.startCfi;
                      },
                      onSelection:
                          (
                            selectedText,
                            cfiRange,
                            selectionRect,
                            viewRect,
                          ) async {
                            if (await controller.onSelection(
                              selectedText,
                              cfiRange,
                            )) {
                              await controller.addPsOrHihglight();
                            }
                          },
                      onDeselection: () {
                        controller.selectionRange = null;
                        controller.selectedText = null;
                      },
                      selectionContextMenu: ContextMenu(
                        menuItems: [
                          ContextMenuItem(
                            title: "Çevir",
                            id: 1,
                            action: () {
                              //controller.epubController.addHighlight(cfi: textSelectionCfi);
                              _showVocabularyPanel(
                                controller.selectedText ?? "",
                              );
                            },
                          ),
                          ContextMenuItem(
                            title: "Not/Vurgula",
                            id: 2,
                            action: () async {
                              await controller.addPsOrHihglight();
                            },
                          ),
                          ContextMenuItem(
                            title: "Paylaş",
                            id: 3,
                            action: () async {
                              RouteFix.toSharePage(
                                controller.selectedText ?? "",
                                controller.bookFromDb?.id ?? 0,
                              );
                            },
                          ),
                        ],
                        settings: ContextMenuSettings(
                          hideDefaultSystemContextMenuItems: true,
                        ),
                      ),
                      onTouchUp: (x, y) async {
                        if (controller.firstLoad) {
                          await controller.loadBook();
                        }
                        controller.showbottomBar.value =
                            !controller.showbottomBar.value;
                        if (controller.selectionRange != null) {
                          controller.epubController.clearSelection();
                        }
                      }, //epubcfi(/6/6!/4/26,/1:131,/1:138)
                    );
                  }
                }),

                Obx(() {
                  if (controller.showbottomBar.value) {
                    return Positioned(
                      bottom: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 35,
                        width: Get.size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                controller.epubController.prev();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () =>
                                  _showSettingPanel(), //_showSettingPanel,
                            ),
                            IconButton(
                              onPressed: controller.loadBook,
                              icon: Icon(Icons.refresh),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                controller.epubController.next();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                Obx(() {
                  if (controller.showbottomBar.value) {
                    return Positioned(
                      top: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 35,
                        width: Get.size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => IconButton(
                                onPressed: () async {
                                  await controller.saveBookmark();
                                },
                                icon: Icon(
                                  Icons.bookmark,
                                  color: controller.isSavedLocation.value
                                      ? Get.theme.primaryColor
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.openChapterDrawer();
                              },
                              icon: Icon(Icons.menu),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSettingPanel() {
    Get.bottomSheet(SettingPanelComponent());
  }

  void _showVocabularyPanel(String word) {
    Get.bottomSheet(
      VocabularyComponent(
        word: word,
        bookId: controller.bookFromDb?.bookId ?? "",
      ),
    );
    controller.epubController.clearSelection();
  }
}
