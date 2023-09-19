import 'package:pdam_bangli/src/core/base_import.dart';

class LoginController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = "", password = "";

  bool isValidatedRemind = false, isCustomer = false;

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

  doLogin() async {
    // todo : validate login form
    // if (usernameController.text.isEmpty) {
    //   Get.snackbar("Perhatian", "Username tidak boleh kosong");
    //   return;
    // }
    // if (passwordController.text.isEmpty) {
    //   Get.snackbar("Perhatian", "Password tidak boleh kosong");
    //   return;
    // }
    // if (usernameController.text != "admin" || passwordController.text != "admin") {
    //   Get.snackbar("Perhatian", "Username atau password salah");
    //   return;
    // }
    if (isCustomer) {
      var result = await LoginCustomerApi().request(numberBankAccount: username, password: password);
      if (result.status) {
        var data = result.data as LoginCustomerResponse;
        await SettingsUtils.set("number_bank_account", username);
        await AuthUtils.setMobileToken(data.token);
        await AuthUtils.setLoggedIn(true);
        Get.offAllNamed(AppRoutes.homePage);
        return;
      }
    } else {
      var result = await LoginOfficerApi().request(username: username, password: password);
      if (result.status) {
        var data = result.data as LoginOfficerResponse;
        await AuthUtils.setMobileToken(data.token);
        await AuthUtils.setLoggedIn(true);
        Get.offAllNamed(AppRoutes.homePage);
        return;
      }
    }
  }

  tapCheckList(val) {
    isValidatedRemind = val;
    update();
  }
}
