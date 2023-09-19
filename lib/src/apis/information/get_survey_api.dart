import 'dart:convert';

import 'package:pdam_bangli/src/core/base_api.dart';
import 'package:pdam_bangli/src/core/base_import.dart';
import 'package:pdam_bangli/src/models/officer/models/report.dart';
import 'package:pdam_bangli/src/models/bank_account/responses/get_complaints_response.dart';

class GetSurveryApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/pengumuman-survey/survey';

  Future<ResultApi> request({required int surveyId}) async {
    url += '/$surveyId';

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) LogUtils.log(requestPayload);

    try {
      await generateHeader(withToken: true);

      var response = await get(Uri.parse(url), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;

      if (checkStatus200(response)) {
        // List<dynamic> responseBody = json.decode(response.body);
        var responseBody = json.decode(response.body);
        // List<Report?> listtData = responseBody.map((e) => Report.fromJson(e)).toList();
        var data = GetComplaintsResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data;
        // responseData.listData = listtData;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
