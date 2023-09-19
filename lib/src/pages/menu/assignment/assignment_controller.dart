import 'package:pdam_bangli/src/apis/officer/get_assignments_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/models/officer/models/report.dart';

import 'sections/assignment_detail_section.dart';
import 'sections/assignment_list_section.dart';

class AssignmentController extends BaseController {
  PageController pageController = PageController();
  int pageIndex = 0;
  bool isRefresh = false;

  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    getReport();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  Future<bool> onWillPop() async {
    return onGoBack();
  }

  onGoBack() async {
    if (pageController.page == 0) {
      pageIndex = 0;
      update();
      return Get.back();
    } else {
      pageIndex = 0;
      update();
      return pageController.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  Widget pageItemBuilder(context, position) {
    switch (position) {
      case 0:
        return const AssignmentSection();
      case 1:
        return const AssignmentDetailSection();
      default:
        return Container();
    }
  }

  tapAssignmentItem() {
    pageIndex = 1;
    update();
    return pageController.nextPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  onRefreshLocation() {
    isRefresh = true;
    update();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        isRefresh = false;
        update();
      },
    );
  }

  getReport() async {
    var result = await GetAssignmentsApi().request();
    if (result.status) {
      List<Report?> data = result.listData as List<Report?>;
    }
  }
}
