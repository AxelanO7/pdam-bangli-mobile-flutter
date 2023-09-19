import 'package:pdam_bangli/src/core/base_import.dart';

class BaseController extends GetxController with WidgetsBindingObserver {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(val) {
    _isLoading = val;
    update();
  }

  @override
  onInit() async {
    super.onInit();
  }

  @override
  onReady() async {
    super.onReady();
  }

  @override
  onClose() {
    super.onClose();
  }

  Future<int>getNumberBankAccount () async {
    return int.parse(await SettingsUtils.getString("number_bank_account"));
  }
}
