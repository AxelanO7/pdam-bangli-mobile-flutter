import 'dart:convert';

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/models/bank_account/models/complaint.dart';

class GetComplaintsApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/rekening/pengaduan';

  Future<ResultApi> request({required int accountId}) async {
    url += '/$accountId';

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await get(Uri.parse(url), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;

      if (checkStatus200(response)) {
        List<dynamic> responseBody = json.decode(response.body);
        // var responseBody = json.decode(response.body);
        List<Complaint?> listData = responseBody.map((e) => Complaint.fromJson(e)).toList();
        // var data = GetReportResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.listData = listData;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
