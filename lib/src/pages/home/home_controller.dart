import 'package:pdam_bangli/src/apis/auth/logout_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/helpers/alert_helper.dart';

class HomeController extends BaseController {
  bool isCustomer = false, isLoggingOut = false;

  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    isCustomer = await SettingsUtils.getString("user_role") == "customer" ? true : false;
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
    Get.back();
    return true;
  }

  tapAccount() {
    Get.toNamed(AppRoutes.accountPage);
  }

  tapBill() {
    Get.toNamed(AppRoutes.billPage);
  }

  tapReport() {
    Get.toNamed(AppRoutes.complaintPage);
  }

  tapSurvey() {
    Get.toNamed(AppRoutes.surveyPage);
  }

  tapAssignment() {
    Get.toNamed(AppRoutes.assignmentPage);
  }

  tapLogout() async {
    isLoggingOut = true;
    update();
    var result = await LogoutApi().request();
    if (result.status) {
      await AuthUtils.removeSession();
      AlertHelper.snackbar(result.message);
      Get.offAllNamed(AppRoutes.onBoardingPage);
    }
    if (result.statusCode == 401) {
      await AuthUtils.removeSession();
      AlertHelper.snackbar(result.message, isError: true);
      Get.offAllNamed(AppRoutes.onBoardingPage);
    } else {
      AlertHelper.snackbar(result.message);
    }
    isLoggingOut = false;
    update();
  }
}
