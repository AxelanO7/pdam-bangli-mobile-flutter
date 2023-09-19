import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class LogoutApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/logout';

  Future<ResultApi> request() async {
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await get(Uri.parse(url), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        responseData.status = true;
        responseData.message = "Berhasil logout";
      }
      if (responseData.statusCode == 401) {
        responseData.message = "Sesi anda telah berakhir, silahkan login kembali";
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
