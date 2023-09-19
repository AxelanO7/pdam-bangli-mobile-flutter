import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';

class GetBillsApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/rekening/tagihan';

  Future<ResultApi> request({required int accountId}) async {
    url += '/$accountId';
    url += '?page=1';

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await get(Uri.parse(url), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;

      if (checkStatus200(response)) {
        // List<dynamic> responseBody = json.decode(response.body);
        // var responseBody = json.decode(response.body);
        // List<Report?> listtData = responseBody.map((e) => Report.fromJson(e)).toList();
        // var data = GetReportResponse.fromJson(responseBody);
        // responseData.status = true;
        // responseData.listData = listtData;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
