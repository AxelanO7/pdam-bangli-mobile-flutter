import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/helpers/alert_helper.dart';
import 'package:pdam_bangli/src/pages/onboarding/popups/onboarding_popup.dart';

class OnboardingController extends BaseController {
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

  showLoginPopup() async {
    await AlertHelper.showBottomSheet(
      const OnboardingPopup(),
    );
  }

  tapLoginCustomer() async {
    await SettingsUtils.set("user_role", "customer");
    update();
    Get.back();
    Get.toNamed(AppRoutes.loginPage);
    return;
  }

  tapLoginOfficer() async {
    await SettingsUtils.set("user_role", "officer");
    update();
    Get.back();
    Get.toNamed(AppRoutes.loginPage);
    return;
  }
}
