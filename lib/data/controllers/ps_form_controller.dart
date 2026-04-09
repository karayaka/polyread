import 'package:get/get.dart';
import 'package:polyread/data/controllers/base_controller.dart';
import 'package:polyread/data/repositories/ps_repository.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_dto_model.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_form_result_model.dart';
import 'package:polyread/models/dto_models/ps_dto_models/ps_page_model.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:polyread/data/services/ad_service.dart';

class PsFormController extends BaseController {
  var formLoading = false.obs;
  var formSaveLoading = false.obs;
  late PsRepository _psRepository;
  PsDtoModel? psFormModel;
  late PsPageModel _pageModel;
  List<String> suggestionTags = [];
  late StringTagController tagController;
  var isUnderline = false.obs;
  var selectedColorHex = 4294967295.obs;

  BannerAd? bannerAd;
  var isBannerLoaded = false.obs;

  @override
  void onInit() {
    _psRepository = Get.find();
    _pageModel = PsPageModel.fromMap(Get.arguments); //todo
    tagController = StringTagController();
    _loadBannerAd();
    loadPsForm();
    super.onInit();
  }

  void _loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdService.instance.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerLoaded.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          isBannerLoaded.value = false;
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void onClose() {
    bannerAd?.dispose();
    super.onClose();
  }

  Future loadPsForm() async {
    try {
      formLoading.value = true;
      if (_pageModel.psCfi != null) {
        var ps = await _psRepository.getPsByText(_pageModel.text);
        if (ps != null) {
          psFormModel = ps.toPsDtoModel();
          psFormModel?.id = ps.id;
          selectedColorHex.value = psFormModel?.colorHex ?? 4294967295;
          isUnderline.value = psFormModel?.underline ?? false;
        }
      }
      psFormModel ??= _pageModel.toDtoModel();
      await loadTags();
      formLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
      formLoading.value = false;
    }
  }

  Future loadTags() async {
    try {
      suggestionTags = await _psRepository.getSuggestionTags();
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future savePs() async {
    try {
      formSaveLoading.value = true;
      if (psFormModel != null) {
        var psStorageModel = psFormModel!
            .toPsStorageModel(); //todo update algoritması yazılacak
        psStorageModel.tags = tagController.getTags;
        psStorageModel.underline = isUnderline.value;
        var psId = await _psRepository.saveOrUpdatePs(psStorageModel);
        Get.back(
          result: PsFormResultModel(
            psId: psId,
            psCfi: psStorageModel.psCfi ?? "",
          ).toMap(),
        );
      }
      formSaveLoading.value = false;
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future deletePs() async {
    try {
      if ((psFormModel?.id ?? 0) != 0) {
        await _psRepository.deletePs(psFormModel?.id ?? 0);
        Get.back(
          result: PsFormResultModel(
            psId: psFormModel?.id ?? 0,
            psCfi: psFormModel?.psCfi ?? "",
          ).toMap(),
        );
      }
    } catch (e) {
      errorMessage(e.toString());
    }
  }
}
