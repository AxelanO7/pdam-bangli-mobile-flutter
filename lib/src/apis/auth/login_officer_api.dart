import 'dart:convert';

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class LoginOfficerApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/pegawai/login';

  Future<ResultApi> request({
    required String username,
    required String password,
  }) async {
    // String fcmToken = await AuthUtils.getFCMToken();
    String fcmToken = "a04a2733146ccd45a22f";

    requestPayload = {
      "username": username,
      "password": password,
      "device_token": fcmToken,
    };

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) print(requestPayload);

    try {
      var response = await post(Uri.parse(url), body: json.encode(requestPayload), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;

      // todo: handle error message
      if (responseData.statusCode >= 300 && (responseData.errorsMessage?["username"] ?? [""]).length > 0) {
        // TinySnackBar.material(
        //   (responseData.errorsMessage?["username"] ?? [""]).first,
        //   type: TinySnackBarType.error,
        //   duration: Duration(seconds: 5),
        //   mobileSnackBarPosition: MobileSnackBarPosition.top,
        //   desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
        // ).show(Get.context!);
        return responseData;
      }

      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = LoginOfficerResponse.fromJson(responseBody);
        // var dataLogin = LoginOfficer.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data;
        responseData.message = data.message;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
