import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:polyread/data/bindings/edit_meta_data_binding.dart';
import 'package:polyread/data/bindings/initial_binding.dart';
import 'package:polyread/data/bindings/profile_binding.dart';
import 'package:polyread/data/bindings/ps_form_binding.dart';
import 'package:polyread/data/bindings/reader_binding.dart';
import 'package:polyread/data/bindings/share_binding.dart';
import 'package:polyread/data/bindings/share_series_binding.dart';
import 'package:polyread/routing/route_const.dart';
import 'package:polyread/views/pages/edit_meta_data_page.dart';
import 'package:polyread/views/pages/library_detail_page.dart';
import 'package:polyread/views/pages/home_page.dart';
import 'package:polyread/views/pages/profile_page.dart';
import 'package:polyread/views/pages/ps_form_page.dart';
import 'package:polyread/views/pages/reader_page.dart';
import 'package:polyread/views/pages/share_page.dart';
import 'package:polyread/views/pages/share_series_page.dart';
import 'package:polyread/models/series_models/earn_series_model.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteConst.splashScrean,
      page: () => HomePage(),
      binding: InitialBinding(),
    ),
    GetPage(name: RouteConst.bookDetail, page: () => LibraryDetailPage()),
    GetPage(
      name: RouteConst.editMetaData,
      page: () => EditMetaDataPage(),
      binding: EditMetaDataBinding(),
    ),
    GetPage(
      name: RouteConst.readerPage,
      page: () => ReaderPage(),
      binding: ReaderBinding(),
    ),
    GetPage(
      name: RouteConst.psFormPage,
      page: () => PsFormPage(),
      binding: PsFormBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: RouteConst.sharePage,
      page: () => SharePage(),
      binding: ShareBinding(),
    ),
    GetPage(
      name: RouteConst.profilePage,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
    ),
    GetPage(
      name: RouteConst.shareSeriesPage,
      page: () => ShareSeriesPage(),
      binding: ShareSeriesBinding(),
      fullscreenDialog: true,
    ),
  ];
}
