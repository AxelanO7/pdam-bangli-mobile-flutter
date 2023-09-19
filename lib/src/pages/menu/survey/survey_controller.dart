import 'package:pdam_bangli/src/core/base_import.dart';

class SurveyController extends BaseController {
  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
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
    Get.back();
    return true;
  }
}
