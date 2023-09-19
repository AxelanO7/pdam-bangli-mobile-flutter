import 'package:pdam_bangli/src/apis/officer/get_assignments_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/helpers/alert_helper.dart';
import 'package:pdam_bangli/src/models/officer/models/report.dart';

import 'sections/assignment_detail_section.dart';
import 'sections/assignment_list_section.dart';

class AssignmentController extends BaseController {
  PageController pageController = PageController();
  int pageIndex = 0;
  bool isRefresh = false, isLoadingAssignments = false;

  Report? selectedAssignment;
  List<Report?>? listAssignment;

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
      Get.back();
      return;
    } else {
      pageIndex = 0;
      update();
      await pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      selectedAssignment = null;
      return;
    }
  }

  Widget pageItemBuilder(context, position) {
    switch (position) {
      case 0:
        return const ListAssignmentSection();
      case 1:
        return const AssignmentDetailSection();
      default:
        return Container();
    }
  }

  tapAssignmentItem(Report item) {
    selectedAssignment = item;
    pageIndex = 1;
    update();
    pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    return;
  }

  onRefreshLocation() async {
    isRefresh = true;
    update();
    await Future.delayed(const Duration(seconds: 2));
    isRefresh = false;
    update();
  }

  getReport() async {
    isLoadingAssignments = true;
    update();
    var result = await GetAssignmentsApi().request();
    if (result.status) {
      listAssignment = result.listData as List<Report?>;
    } else {
      AlertHelper.snackbar(result.message, isError: true, title: "Gagal");
    }
    print('length ${listAssignment?.length}');
    isLoadingAssignments = false;
    update();
  }
}
