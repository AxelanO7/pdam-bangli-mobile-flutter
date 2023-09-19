import 'package:pdam_bangli/src/core/base_import.dart';

class StartupController extends BaseController {
  @override
  onInit() async {
    AuthUtils.getAppToken();
    AuthUtils.isLoggedIn();
    super.onInit();
  }

  @override
  onReady() async {
    await Future.delayed(const Duration(seconds: 1));
    if (await AuthUtils.isLoggedIn()) {
      Get.offNamed(AppRoutes.homePage);
      return;
    } else {
      Get.offNamed(AppRoutes.onBoardingPage);
      return;
    }
    super.onReady();
  }

  @override
  onClose() {
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
