import 'package:pdam_bangli/src/core/base_import.dart';

import 'sections/bill_list_section.dart';
import 'sections/bill_purchase_section.dart';

class BillController extends BaseController {
  PageController pageController = PageController();
  int pageIndex = 0;
  bool isLoadingGetBill = false;

  @override
  onInit() {
    isLoadingGetBill = true;
    update();
    super.onInit();
  }

  @override
  onReady() async {

    isLoadingGetBill = false;
    update();
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
      pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      return;
    }
  }

  Widget pageItemBuilder(context, position) {
    switch (position) {
      case 0:
        return const BillListSection();
      case 1:
        return const BillPurchaseSection();
      default:
        return Container();
    }
  }

  tapBillItem() {
    pageIndex = 1;
    update();
    return pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}
