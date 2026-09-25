import 'package:get/get.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/controllers/my_books_controller.dart';
import 'package:polyread/data/local_storage/models/library_storage_model.dart';
import 'package:polyread/data/repositories/library_repository.dart';
import 'package:textfield_tags/textfield_tags.dart';

class EditTagController extends BaseController {
  late LibraryRepository db;
  late StringTagController tagController;
  List<String> suggestionTags = [];
  final int id;
  RxBool loading = false.obs;
  RxBool saveLoading = false.obs;
  LibraryStorageModel? model;
  RxList<String> initialTags = RxList.empty();

  EditTagController({required this.id}) {
    db = Get.find();
  }

  Future init() async {
    loading.value = true;
    model = await db.getLibraryBookById(id);
    initialTags.addAll(model?.tags ?? []);
    tagController = StringTagController();
    _loadSuggestionTags();
    loading.value = false;
  }

  Future _loadSuggestionTags() async {
    suggestionTags.clear();
    suggestionTags = await db.getAllTags();
  }

  Future<void> saveTags() async {
    try {
      saveLoading.value = true;
      if (model != null) {
        model!.tags = tagController.getTags;
        await db.saveLibraryBook(model!);
      }
      saveLoading.value = false;
      Get.back(closeOverlays: true);
      Get.find<MyBooksController>().getMyBooks();
    } catch (e) {
      errorMessage(e.toString());
      loading.value = false;
    }
  }
}
