import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/core/app_tools/tools.dart';
import 'package:polyread/core/base_components/custom_file_image_component.dart';
import 'package:polyread/data/controllers/edit_meta_data_controller.dart';

class EditMetaDataPage extends GetView<EditMetaDataController> {
  const EditMetaDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.formLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  actions: [
                    Obx(() {
                      if (controller.saveButtonLoading.value) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      } else {
                        return IconButton(
                          onPressed: () => controller.saveBook(),
                          icon: const Icon(Icons.save),
                        );
                      }
                    }),
                  ],
                  pinned: true,
                  expandedHeight: 300,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    title: Text(
                      controller.formModel?.title ?? "Kitap Düzenle",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                    background: GestureDetector(
                      onTap: () => controller.pickCoverImage(),
                      child: Container(
                        color: Colors.grey[300],
                        child:
                            controller.formModel?.coverPath != null &&
                                controller.formModel!.coverPath!.isNotEmpty
                            ? CustomFileImageComponent(
                                path: controller.getBookCoverPath(),
                              )
                            : const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image_outlined, size: 64),
                                    SizedBox(height: 8),
                                    Text("Kapak Seçmek için Tıkla"),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: controller.editFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Kitap Adı
                          Text(
                            "Kitap Adı",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            initialValue: controller.formModel?.title ?? "",
                            decoration: InputDecoration(
                              hintText: "Kitap adını girin",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onChanged: (value) =>
                                controller.formModel?.title = value,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Kitap adı boş olamaz";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          const Divider(),
                          const SizedBox(height: 16),

                          // Yazarlar
                          Text(
                            "Yazarlar",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Obx(() {
                            return Column(
                              children: [
                                ...List.generate(
                                  controller.autors.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(controller.autors[index]),
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          onPressed: () {
                                            controller.deleteAutor(index);
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  textInputAction: TextInputAction.go,
                                  onSubmitted: (value) => controller.addAutor(),
                                  controller: controller.autorController,
                                  decoration: InputDecoration(
                                    hintText: "Yeni yazar ekle",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton.icon(
                                    onPressed: controller.addAutor,
                                    icon: const Icon(Icons.add),
                                    label: const Text("Yazar Ekle"),
                                  ),
                                ),
                              ],
                            );
                          }),
                          const SizedBox(height: 24),
                          const Divider(),
                          const SizedBox(height: 16),

                          // Dil Seçimi
                          Text(
                            "Dil",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return DropdownButtonFormField<String>(
                              initialValue:
                                  controller.selectedLanguge.value.isEmpty
                                  ? "tr"
                                  : controller.selectedLanguge.value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: Tools.selectLanguges,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.selectedLanguge.value = value;
                                }
                              },
                            );
                          }),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: Obx(() {
                                  return ElevatedButton(
                                    onPressed:
                                        controller.saveButtonLoading.value
                                        ? null
                                        : () => controller.saveBook(),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                    ),
                                    child: controller.saveButtonLoading.value
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : const Text("Kaydet"),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
