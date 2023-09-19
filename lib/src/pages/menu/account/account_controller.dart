import 'package:pdam_bangli/src/apis/bank_account/get_detail_bank_account_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/models/bank_account/models/detail_bank_account.dart';

class AccountController extends BaseController {
  bool isCustomer = false, isRefresh = false, isLoadingGetBankAccount = false;
  int numberBankAccount = 0;

  late DetailBankAccount detailBankAccount;

  @override
  onInit() {
    isLoadingGetBankAccount = true;
    update();
    super.onInit();
  }

  @override
  onReady() async {
    isCustomer = await SettingsUtils.getString("user_role") == "customer" ? true : false;
    numberBankAccount = await getNumberBankAccount();
    await getDetailBankAccount();
    isLoadingGetBankAccount = false;
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

  onRefreshLocation() {
    isRefresh = true;
    update();
  }

  getDetailBankAccount() async {
    var result = await GetDetailBankAccountApi().request(numberBankAccount: numberBankAccount);
    if (result.status) {
      detailBankAccount = result.data as DetailBankAccount;
    }
  }
}
